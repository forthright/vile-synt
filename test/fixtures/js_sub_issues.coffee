module.exports = [
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
    "where": [
      {
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
]
