class Hashmap
  def initialize(key, value)
    @bucket = Array.new(16)
    @key = key
    @value = value
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code % @bucket.size
  end

  def set(key, value)
    index_key = hash(key)
    if @bucket.include?(key)
      @bucket[@bucket.index(key)] = {key => value}
    elsif @bucket[index_key] != nil #if index is already taken, add to an empty index
      @bucket[index_key] = {key => value}
    else
      @bucket[index_key] = {key => value}
    end

  end

  def get(key)
    @bucket.each do |ind|
      if ind.is_a?(Hash)
        if ind.has_key?(key)
          puts ind.values
        end
      end
    end
  end

  def has?(key)
  end

  def remove(key)
  end

  def length
  end

  def clear
  end

  def keys
  end

  def values
  end

  def entries
  end

end

