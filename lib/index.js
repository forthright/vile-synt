"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var _ = require("lodash");
var synt = require("synt");
var vile = require("vile");
var unixify = require("unixify");
var is_ts_or_js_file = function (target) {
    return /\.(js|ts)$/.test(target);
};
var allowed = function (ignore, allow) {
    var filtered = vile.filter(ignore, allow);
    return function (target, is_dir) {
        return filtered(target) &&
            (is_dir || is_ts_or_js_file(target));
    };
};
var each_match = function (group, cb) {
    _.each(group, function (list, similarity) {
        _.each(list, function (match) {
            cb(match, _.toNumber(similarity));
        });
    });
};
var line_info_item = function (line, key) {
    var sl = _.get(line, key + ".line", undefined);
    var sc = _.get(line, key + ".column", undefined);
    var info = {};
    if (sl !== undefined)
        info.line = sl;
    if (sc !== undefined)
        info.character = sc;
    return info;
};
var synt_line_to_vile_line = function (line) {
    return {
        end: line_info_item(line, "end"),
        start: line_info_item(line, "start")
    };
};
var duplicate_info = function (match) {
    var locations = _.map(match, function (result) {
        return {
            path: unixify(result.path),
            where: synt_line_to_vile_line(result.pos)
        };
    });
    return { locations: locations };
};
var signature = function (match, similarity) {
    var sig = "synt::" + similarity;
    _.each(match, function (item) {
        var line = _.map(_.flatMap(_.valuesIn(item.pos), _.valuesIn), function (num) { return num || 0; });
        sig += ":" + unixify(item.path) + ":" + _.join(line, ":");
    });
    return sig;
};
var filepath = function (match) {
    return unixify(_.get(_.first(match), "path", ""));
};
var issue = function (match, sim) {
    return vile.issue({
        duplicate: duplicate_info(match),
        path: filepath(match),
        signature: signature(match, sim),
        type: vile.DUPE
    });
};
var compare = function (files, config) {
    var _a = synt.compare(files, config), js = _a.js, ts = _a.ts;
    var issues = [];
    var append_new_issue = function (match, sim) { return issues.push(issue(match, sim)); };
    each_match(js, append_new_issue);
    each_match(ts, append_new_issue);
    return issues;
};
var punish = function (user_config) {
    return vile.promise_each(process.cwd(), allowed(_.get(user_config, "ignore", []), _.get(user_config, "allow", [])), function (filename) { return filename; }, { read_data: false }).then(function (files) {
        return compare(files, _.get(user_config, "config", {}));
    });
};
exports.punish = punish;
