class Campaigner < Thor
  include Thor::Actions

  # Thor uses this method for file related methods
  def self.source_root
    File.dirname(__FILE__)
  end

  desc "start_session", "Creates an empty session_notes.md file and opens it in your text editor"
  def start_session
  end

  desc "create_campaign", "Create a campaign"
  def create_campaign
    name = ask "What is the name of your campaign?"
    description = ask "Describe #{name} in one or two sentences"

    campaign = Campaign.create! name: name, description: description

    say "Successfully created campaign!\nName: #{campaign.name}\nDescription: #{campaign.description}"

  rescue => e
    handle_error e
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
    file_path = _session_file_path "session_plan.md"
    campaigns = Campaign.all

    if campaigns.any?
      campaign_options = campaigns.each_with_index do |campaign, index|
        say "#{index + 1}) #{campaign.name}"
      end
      selected_option = ask "Which campaign are you playing?"
      campaign = campaigns[selected_option.to_i - 1]
    else
      say "You have no campaigns yet! Create one with create_campaign first"
      exit 1
    end

    if campaign.sessions.any?
      latest_session = campaign.sessions.latest
      say "The last session is number #{latest_session.number}"
    end

    number = ask "What session number are you planning?"
    title = ask "What's the title for this session? (leave empty for untitled')"
    session = Session.create! title: title, number: number, campaign: campaign

    note = Note.create!(note_type: :plan, session: session, text: "# #{session.title} Plan\n")

    if _overwriting_session_file file_path
      remove_file file_path
    end

    create_file file_path, note.to_markdown
    say "File created, ready to start plan", :green
    _open_system_editor file_path

  rescue => e
    _handle_error e
  end

  desc "end_session_plan", "Persist session_plan.md and deletes the file"
  def end_session_plan
  end

  no_commands do
    def _handle_error e
      say "Something went wrong!"
      say e.message, :red
      exit 1
    end

    def _overwriting_session_file file_path
      File.exists?(file_path) && yes?("There is a session plan that hasn't been persisted, would you like to overwrite?")
    end

    def _session_file_path filename
      File.expand_path("../session_files/#{filename}", File.dirname(__FILE__))
    end

    def _open_system_editor file_path
      system "#{ENV['EDITOR'] || 'vim'} #{file_path}"
    end
  end

end
