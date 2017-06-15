module.exports = [
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
