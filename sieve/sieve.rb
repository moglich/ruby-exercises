class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    range = (2..@limit).map {|n| n}
    prime = []
    while range.size > 0
      prime << range.shift
      range.each do |n|
        if (n % prime.last) == 0
          if n != prime.last
            range.delete(n)
          end
        end
      end
    end
    prime
  end
end
