#class SimpleCov::FileList < Array
#  def covered_strength
#    return 0 if empty? or lines_of_code == 0
#    map {|f| f.covered_strength }.inject(&:+).to_f / size
#  end
#end
#
#module SimpleCov
#  class SourceFile
#    class Line
#      def covered_percent
#        return 100.0 if lines.length == 0 or lines.length == never_lines.count
#        relevant_lines = lines.count - never_lines.count - skipped_lines.count
#        if relevant_lines == 0
#          0
#        else
#          (covered_lines.count) * 100.0 / relevant_lines.to_f
#        end
#      end
#    end
#  end
#end
#
