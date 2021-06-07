require 'front_matter_parser'

class Note < ApplicationRecord
  belongs_to :session
  enum note_type: [:plan, :summary, :game_notes]

  def self.update_from_markdown file
    parsed = FrontMatterParser::Parser.parse_file file
    note = find parsed.front_matter['note_id']
    note.update!(text: parsed.content)
    note
  end

  def to_markdown
    output_string = <<~FRONTMATTER
      ---
      note_id: #{id}
      ---

      Campaign - #{session.campaign.name}

    FRONTMATTER

    output_string << text
  end
end
