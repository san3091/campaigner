class Note < ApplicationRecord
  belongs_to :session
  enum note_type: [:plan, :summary, :game_notes]

  def self.create_from_markdown file

  end

  def to_markdown
    output_string = <<~FRONTMATTER
      ---
      campaign: #{session.campaign.name}
      session_number: #{session.number}
      session_id: #{session.id}
      note_type: #{note_type}
      ---

    FRONTMATTER

    output_string << text
  end
end
