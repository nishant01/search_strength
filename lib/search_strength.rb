class SearchStrength

  def initialize(input)
    @input = input
  end

  def process_input
    puts "Processing Input File..."
    page = []
    query = []
    count = 8
    @input.split("\n").each do |input|
      sliced_input = input.split(/\s/)
      if sliced_input[0] == "P"
        page_line = {}
        page_key_array = sliced_input.reject{|key| key == "P" }
        page_key_array.each_with_index do |key, i|
          page_line.merge!(key.to_sym => count - i)
        end
        page << page_line
      end
      if sliced_input[0] == "Q"
        query_line = {}
        query_key_array = sliced_input.reject{|key| key == "Q" }
        query_key_array.each_with_index do |key,i|
          query_line.merge!(key.to_sym => count - i)
        end
        query << query_line
      end
    end
    if page.length > 0 && query.length > 0
      puts "Input File processed sucessfully."
      search_algo(page, query)
    else
      puts "Please enter proper file parameter."
    end
  end

  def search_algo(page, query)
    puts "Now searching pages that match each of an arbitrary number of queries."
    pre_result = []
    query.each_with_index do |q_key, i|
      pre_result[i] = {}
      page.each_with_index do |pg, j|
        weights = 0
        q_key.each_with_index do |key, _k|
          weights += pg.has_key?(key[0]) ? pg[key[0]] * key[1] : 0
          pre_result[i].merge!("P"+"#{j+1}" => weights) unless weights.to_i == 0
        end
      end
    end
    sort_algo(pre_result)
  end

  private

  def sort_algo(pre_result)
    puts "Result..."
    pre_result.each_with_index do |datum, i|
      show_result(datum.sort_by {|key, value| [-value, key]}.to_h.keys, i)
    end
  end

  def show_result(result, i)
    puts "Q#{1 + i}: " + result.join(" ")
  end

end
