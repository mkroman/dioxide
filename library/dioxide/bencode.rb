# encoding: utf-8

# TODO make this an includable module

class Array;      def bencode; [?l, map(&:bencode), ?e].join end end
class String;     def bencode; [length, ?:, self].join end end
class Fixnum;     def bencode; [?i, self, ?e].join end end
class Object;     def bencode; to_s.bencode end end
class TrueClass;  def bencode; 1.bencode end end
class FalseClass; def bencode; 0.bencode end end

class Hash
  def bencode
    map do |key, value|
      [key.to_s.gsub(?_, ' '), value].map &:bencode
    end.unshift(?d).push(?e).join
  end
end
