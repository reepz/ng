class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)

    # remove everything but the bracket chars
    stripped = record.title.gsub(/[^\[\]\(\)\{\}]/, '')

    if stripped.size.odd?
      record.errors.add(:title, "missing opening or closing bracket(s)")
    end

    if stripped_array[0] == ']'  || stripped_array[0] == ')' || stripped_array[0] == '}'
      record.errors.add(:title, "incorrect brackets order")
    end

    # make an array containing all brackets in title
    stripped_array = []
    stripped.each_char do |c|
      stripped_array << c
    end

    # array of brackets that have no text inside
    empty_brackets = ['()', '[]', '{}']

    empty_brackets.each do |element|
      if record.title.include?(element)
        record.errors.add(:title, "empty brackets found")
      end
    end

  end
end
