#!/usr/bin/env ruby

class Eratos
  def self.search(args)
    error_message = '探索範囲の末尾を2以上の整数で指定してください'

    return error_message if args.size != 1

    end_number = args.first

    return error_message unless end_number =~ /^\d+$/

    end_number = end_number.to_i
    return error_message if end_number < 2

    max = Math.sqrt(end_number)
    fn = lambda do |max, result, data|
      base = data.shift
      result << base
      data.delete_if { |i| i%base === 0 }
      (data.empty? || max < data.first) ? result + data : fn.call(max, result, data)
    end

    target = (2..end_number).to_a
    fn.call(max, [], target)
  end
end

if $0 == __FILE__
  p Eratos.search(ARGV)
end
