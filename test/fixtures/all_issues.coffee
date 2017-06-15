module.exports = [
  {
    "duplicate": {
      "locations": [
        {
          "path": "src/foo.js"
          "where": {
            "end": {
              "character": 1
              "line": 8
            }
            "start": {
              "character": 12
              "line": 1
            }
          }
        }
        {
          "path": "src/sub/baz.js"
          "where": {
            "end": {
              "character": 1
              "line": 17
            }
            "start": {
              "character": 0
              "line": 10
            }
          }
        }
      ]
    }
    "path": "src/foo.js"
    "signature": "synt::81:src/foo.js:1:12:8:1:src/sub/baz.js:10:0:17:1"
    "type": "duplicate"
  }
  {
    "duplicate": {
      "locations": [
        {
          "path": "src/foo.js"
          "where": {
            "end": {
              "character": 1
              "line": 17
            }
            "start": {
              "character": 16
              "line": 10
            }
          }
        }
        {
          "path": "src/sub/baz.js"
          "where": {
            "end": {
              "character": 1
              "line": 8
            }
            "start": {
              "character": 0
              "line": 1
            }
          }
        }
      ]
    }
    "path": "src/foo.js"
    "signature": "synt::81:src/foo.js:10:16:17:1:src/sub/baz.js:1:0:8:1"
    "type": "duplicate"
  }
  {
    "duplicate": {
      "locations": [
        {
          "path": "src/foo.js"
          "where": {
            "end": {
              "character": 1
              "line": 17
            }
            "start": {
              "character": 16
              "line": 10
            }
          }
        }
        {
          "path": "src/sub/baz.js"
          "where": {
            "end": {
              "character": 1
              "line": 17
            }
            "start": {
              "character": 0
              "line": 10
            }
          }
        }
      ]
    }
    "path": "src/foo.js"
    "signature": "synt::85:src/foo.js:10:16:17:1:src/sub/baz.js:10:0:17:1"
    "type": "duplicate"
  }
  {
    "duplicate": {
      "locations": [
        {
          "path": "src/foo.js"
          "where": {
            "end": {
              "character": 1
              "line": 8
            }
            "start": {
              "character": 12
              "line": 1
            }
          }
        }
        {
          "path": "src/sub/baz.js"
          "where": {
            "end": {
              "character": 1
              "line": 8
            }
            "start": {
              "character": 0
              "line": 1
            }
          }
        }
      ]
    }
    "path": "src/foo.js"
    "signature": "synt::86:src/foo.js:1:12:8:1:src/sub/baz.js:1:0:8:1"
    "type": "duplicate"
  }
  {
    "duplicate": {
      "locations": [
        {
          "path": "src/sub/baz.js"
          "where": {
            "end": {
              "character": 1
              "line": 8
            }
            "start": {
              "character": 0
              "line": 1
            }
          }
        }
        {
          "path": "src/sub/baz.js"
          "where": {
            "end": {
              "character": 1
              "line": 17
            }
            "start": {
              "character": 0
              "line": 10
            }
          }
        }
      ]
    }
    "path": "src/sub/baz.js"
    "signature": "synt::86:src/sub/baz.js:1:0:8:1:src/sub/baz.js:10:0:17:1"
    "type": "duplicate"
  }
  {
    "duplicate": {
      "locations": [
        {
          "path": "src/foo.js"
          "where": {
            "end": {
              "character": 1
              "line": 8
            }
            "start": {
              "character": 12
              "line": 1
            }
          }
        }
        {
          "path": "src/foo.js"
          "where": {
            "end": {
              "character": 1
              "line": 17
            }
            "start": {
              "character": 16
              "line": 10
            }
          }
        }
      ]
    }
    "path": "src/foo.js"
    "signature": "synt::95:src/foo.js:1:12:8:1:src/foo.js:10:16:17:1"
    "type": "duplicate"
  }
  {
    "duplicate": {
      "locations": [
        {
          "path": "src/foo.ts"
          "where": {
            "end": {}
            "start": {
              "character": 12
              "line": 1
            }
          }
        }
        {
          "path": "src/foo.ts"
          "where": {
            "end": {}
            "start": {
              "character": 12
              "line": 10
            }
          }
        }
      ]
    }
    "path": "src/foo.ts"
    "signature": "synt::85:src/foo.ts:12:1:src/foo.ts:12:10"
    "type": "duplicate"
  }
]
