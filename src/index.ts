import _  = require("lodash")
import synt = require("synt")
import vile = require("vile")
import unixify = require("unixify")

const is_ts_or_js_file = (target : string) : boolean =>
  /\.(js|ts)$/.test(target)

const allowed = (
  ignore : vile.IgnoreList,
  allow : vile.AllowList
) : (t : string, i : boolean) => boolean => {
  const filtered = vile.filter(ignore, allow)
  return (target, is_dir) =>
    filtered(target) &&
      (is_dir || is_ts_or_js_file(target))
}

const each_match = (
  group : synt.ParseResultGroup,
  cb : (m : synt.ParseResult[], s : number) => void
) => {
  _.each(group, (
    list : synt.ParseResultMatchList,
    similarity : string
  ) => {
    _.each(list, (match : synt.ParseResult[]) => {
      cb(match, _.toNumber(similarity))
    })
  })
}

const line_info_item = (
  line : synt.LineInfo,
  key : string
) : vile.IssueLine => {
  const sl =_.get(line, `${key}.line`, undefined)
  const sc = _.get(line, `${key}.column`, undefined)
  const info : vile.IssueLine = {}
  if (sl !== undefined) info.line = sl
  if (sc !== undefined) info.character = sc
  return info
}

const synt_line_to_vile_line = (
  line : synt.LineInfo
) : vile.IssueLocation => {
  return {
    end: line_info_item(line, "end"),
    start: line_info_item(line, "start")
  }
}

const duplicate_info = (
  match : synt.ParseResult[]
) : vile.Duplicate => {
  const locations : vile.DuplicateLocations[] = _.map(
    match,
    (result : synt.ParseResult) => {
      return {
        path: unixify(result.path),
        where: synt_line_to_vile_line(result.pos)
      }
    })

  return { locations }
}

// synt::sim::f1:l||0:c||0:l2||0:c2||0::f2...
const signature = (
  match : synt.ParseResult[],
  similarity : number
) : string => {
  let sig : string = `synt::${similarity}`
  _.each(match, (item : synt.ParseResult) => {
    const line = _.map(
      _.flatMap(_.valuesIn(item.pos), _.valuesIn),
      (num : number) => num || 0 )
    sig += `:${unixify(item.path)}:${_.join(line, ":")}`
  })
  return sig
}

const filepath = (match : synt.ParseResult[]) : string =>
  unixify(_.get(_.first(match), "path", ""))

const issue = (
  match : synt.ParseResult[],
  sim : number
) : vile.Issue =>
  vile.issue({
    duplicate: duplicate_info(match),
    path: filepath(match),
    signature: signature(match, sim),
    type: vile.DUPE,
    where: synt_line_to_vile_line(
      _.get(_.first(match), "pos"))
  })

const compare = (
  files : string[],
  config : synt.CompareOptions
) : vile.IssueList => {
  const { js, ts } = synt.compare(files, config)
  const issues : vile.IssueList = []
  const append_new_issue = (
    match : synt.ParseResult[],
    sim : number
  ) => issues.push(issue(match, sim))

  each_match(js, append_new_issue)
  each_match(ts, append_new_issue)

  return issues
}

const punish = (user_config : vile.PluginConfig) =>
  vile.promise_each(
    process.cwd(),
    allowed(
      _.get(user_config, "ignore", []),
      _.get(user_config, "allow", [])
    ),
    (filename : string) => filename,
    { read_data: false }
  ).then((files : string[]) =>
    compare(files, _.get(user_config, "config", {})))

export { punish }
