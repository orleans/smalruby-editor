# -*- coding: utf-8 -*-
module RubyToBlock
  module Block
    class EventBroadcast < CharacterEvent
      blocknize ['^\s*',
                 CHAR_RE,
                 'broadcast\(\s*("[^"]*")\)',
                 '\s*$'].join(''),
                 statement: true, inline: true

      def self.process_match_data(md, context)
        md2 = regexp.match(md[type])
        add_character_method_call_block(context, md2[1], new, MESSAGE: md2[2])
        true
      end
    end
  end
end
