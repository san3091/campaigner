# CLI campaign tracker for D&D

The workflow is as follows:

```bash
$ bin/run create_campaign

$ bin/run start_session_plan

$ bin/run end_session_plan

$ bin/run start_session

$ bin/run end_session
```

Each step creates a file for one of the three types of notes `plan`, `session_notes`, and `summary`. The files created contain yaml style front matter which allows the next step to create the correct associations.

TODO

- read from file into db
- implement the rest of the methods...

