# -*- coding: utf-8 -*-
module RubyToBlock
  module Block
    class EventBroadcast < CharacterEvent
      blocknize ['^\s*',
                 CHAR_RE,
                 'on\(:receive,\s*("[^"),]*")\)\s+do',
                 '\s*$'].join(''),
                 statement: true, indent: true

      def self.process_match_data(md, context)
        md2 = regexp.match(md[type])
        add_character_event_blocks(context, md2[1], new, MESSAGE: md2[2])
        true
      end
    end
  end
end
