class Hashmap
  def initialize(key = nil, value = nil)
    @bucket = Array.new(16)
    @key = key
    @value = value
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code % @bucket.size
  end

  def set(key, value)
    index_key = hash(key)
  
    if @bucket[index_key].is_a?(Hash)
      if @bucket[index_key].key?(key)
        @bucket[index_key][key] = value
      else
        @bucket[index_key][key] = value
      end
    else
      @bucket[index_key] = {key => value}
    end
  end
  
  def resize
    if @bucket.length / length > @load_factor
      new_size = @bucket.size * 2
      new_bucket = Array.new(new_size)

      @bucket.each do |bucket|
        next unless bucket.is_a?(Hash)
        bucket.each do |key, value|
          new_index = hash(key) % new_size
          if new_bucket[new_index].nil?
            new_bucket[new_index] = {key => value}
          else
            new_bucket[new_index][key] = value
          end
        end
      end

      @bucket = new_bucket
    end
  end

  def bucketCount
    @bucket.length
  end

  def get(key)
    @bucket.each do |ind|
      if ind.is_a?(Hash) && ind.key?(key)
        return ind[key]
      end
    end
    nil
  end

  def has?(key)
    @bucket.each do |ind|
      if ind.is_a?(Hash) && ind.has_key?(key)
        return true
      end
    end
    false
  end

  def remove(key)
    @bucket.each do |ind|
      if ind.is_a?(Hash)
        if ind.has_key?(key)
          ind.delete(key)
        end
      end
    end
  end

  def length
    size = 0
    @bucket.each do |bucket|
      if bucket.is_a?(Hash)
        size += bucket.size
      end
    end
    size
  end

  def clear
    @bucket = Array.new(16)
  end

  def keys
    @keys = []
    @bucket.each do |ind|
      if ind.is_a?(Hash)
        @keys << ind.keys
      end
    end
  end

  def values
    @values = []
    @bucket.each do |ind|
      if ind.is_a?(Hash)
        @values << ind.values
      end
    end
  end

  def entries
    @key_val = {}
    @bucket.each do |ind|
      if ind.is_a?(Hash)
        @key_val.merge!(ind)
      end
    end
    @key_val.to_a
  end

end

