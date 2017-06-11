path = require "path"
_ = require "lodash"
sinon = require "sinon"
chai = require "./../helpers/sinon_chai"
system = require "./../helpers/system"
mimus = require "mimus"
vile = require "vile"
expect = chai.expect
lib = require "./../../lib"

TS_ISSUES = require "./../fixtures/ts_issues"
ALL_ISSUES = require "./../fixtures/all_issues"
JS_SUB_ISSUES = require "./../fixtures/js_sub_issues"

describe "vile-synt", ->
  system.change_into_system_test_dir_on_each()

  describe "punish", ->
    describe "default", ->
      config = allow: [ "src" ]

      it "can find duplicates for ts and js files", ->
        lib.punish(config).should.eventually.eql ALL_ISSUES

      it "incudes all unique signatures", (done) ->
        lib.punish(config).then (issues) ->
          process.nextTick ->
            uniq_sigs = _.uniq(_.map(issues, (i) -> i.signature))
            expect(uniq_sigs.length).to.eql issues.length
            done()
        return

    describe "allow", ->
      config = allow: [ "src/sub" ]

      it "allows only some files", ->
        lib.punish(config).should.eventually.eql JS_SUB_ISSUES

    describe "ignore", ->
      describe "when everything is ignored", ->
        it "returns an empty array", ->
          config = ignore: [ "*" ]
          lib.punish(config).should.eventually.eql []

      it "ignores some files", ->
        config = ignore: [ "src/sub", "src/*.js" ]
        lib.punish(config).should.eventually.eql TS_ISSUES
