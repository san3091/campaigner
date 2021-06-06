class Campaigner < Thor
  desc "start_session", "Creates an empty session_notes.md file and opens it in your text editor"
  def start_seesion args
    # what campaign? (list campaigns)
    # session number? last session was number _
    # whats the title? (empty for untitled)
    #
    # check for file, if there's a file there prompt if you want to overwrite, if no, then exit and say run end-session to import open file
  end

  desc "create_campaign", "Create a campaign"
  def create_campaign
    # whats your campaign name?
    # description?
    #
    # create in db
    # done!
  end

  desc "end_session", "Persists the session notes and creates a summary.md file"
  def end_session
    # check for session_notes, if not say 'no session_notes.md file :('
    # parse session notes, use frontmatter to set up associations
    #
    # save the content part
    # done
  end

  desc "start_session_plan", "Creates a session_plan.md file for planning notes and opens in text editor"
  def start_session_plan
    # check for file
    # create session_plan file
    # open in editor
  end

  desc "end_session_plan", "Persist session_plan.md and deletes the file"
  def end_session_plan
  end

end
