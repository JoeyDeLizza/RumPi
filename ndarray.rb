## TODO:
## Generalize array dimensions
## Generalize element-wise multiplication
## Format to_s to ouput aligned to largest diget index
##Cozak sequence euk
class Ndarray
  attr_reader :array

  def initialize(array)
    print "Initing"
    print array
    @array = array
    puts ''
    print @array
  end

  ## format better
  def to_s
    if shape.length == 1
      print "In toS"
      return @array.to_s
    end
    s = "["
    @array[0].each {|a| s+= a.to_s + "\n"}
    s = s.chop
    s += "]"
  end

  def [] i
    @array[i]
  end

  def shape
    t = @array
    s = []
    while t.respond_to?(:length)
      s.append(t.length)
      t = t[0]
    end
    return s 
  end

  def self.empty(shape)
    print "In empty\n"
    array = []
    print 'Printing shape: '
    print shape
    emp = Array.new(shape[-1], nil)
    if shape.length == 1
      print "In if\n"
      return Ndarray.new(emp)
    end
    print emp
    puts ''
    shape.reverse_each do |n|
      array = spread(emp, n)
      print "Printing array:" 
      print array
      puts ''
    end
    print "Outt of bloack:\n"
    print array
    return Ndarray.new([array])
  end

  def self.spread(array, n)
    print "In spread:\n "
    print array
    puts ''
    arr = Array.new(n, array)
  end
  
  def row(i)
    return @array[i]
  end

  def col(i)
    v = []
    for j in 0..shape[0]-1
      row = row(j)
      v.append([row[i]])
    end

    return Ndarray.new(v)
  end

  def at_i(i)
    print i
    print shape[0]
    row = i / shape[0]
    col = i % shape[0]
    print row
    print col
  end
    
  def add(*args)
    shape = args[0].shape
    arr = []
    row = []
    sum = 0
      for m in 0..shape[0]-1
        for n in 0..shape[1]-1
          for i in 0..args.size-1
            sum += args[i].array[m][n]
            
          end
          row << sum
          sum = 0
        end
        arr.append(row)
        row = []
      end
      return Ndarray.new(arr)
  end

    

  ## [2 2] [2 2]
  ## [2 2] [2 2]
  def mul(a, b)
    c = []
    row = []
    unless a.shape[1] != b.shape[0]
      for i in 0..a.shape[0]
        for j in 0..a.shape[1]
        row.append(dot(row(i), col(j)))
        end
        print "Here"
      end
      return c
    end
    return c
  end

  def multiply(a, b)
    v = []
    for i in 0..a[0].size-1
      v.append(a[0][i] * b[0][i])
    end
    return Ndarray.new([v])
      
  end

  def dot(a, b)
    print "In dot"
    print a.shape
    print b.shape
    print a
    print b
    sum = 0
    for i in 0..b.shape[0]
      print b.shape
      for j in 0..b.shape[1]
        sum += (a[i][j] * b[i][j])
        print sum.to_s + "\n"
      end
    end
    return sum 
  end

  ##def sum(axis=0)
    

  def transpose(a)
    array = []
    for i in 0..a.shape[1]-1
      row = []
      print "Column: " + a.col(i).to_s
      col = a.col(i)
      for j in 0..a.shape[0]-1
        row.append(col[j][0])
        print "Appending Row:"
        print row
      end
        array.append(row)
    end
    return Ndarray.new(array)
  end


  def self.zeros(shape)
    row = []
    mat = []
    m = shape[0]
    n = shape[1]
    i = 0
    j = 0
    while i < m
      while j < n
        row.append(0)
        j += 1
      end
      mat.append(row)
      row = []
      j = 0
      i += 1
    end
    Ndarray.new(mat)
  end


  private def array_to_s(a)
    s = "[ "
    a.each do |i|
      unless i == nil
        s+= i.to_s + " "
      else
        s+= "nil "
      end
    end
    s += "]"
  end
    
    
end

##a = Ndarray.new([[1, 2, 3],
##                 [4, 5, 6]])
##
##puts ''
##
##ans = a.add(a, a)
##puts ''
##print a
##puts ''
##print ans
##
##zero = Ndarray.zeros([2,2])
##puts ''
##print zero
##puts ''
##print zero.shape
##
####empty = Ndarray.empty([4, 2,2])
##print "Printing 4dim"
##puts ''
##
####print empty
##
##three = Ndarray.new([
##                      [
##                        [
##                          [[1,2,3],
##                           [4,5,6]],
##                          [[1,2,3],
##                           [4,5,6]]
##                        ],
##                        [
##                          [[1,2,3],
##                           [4,5,6]],
##                          [[1,2,3],
##                           [4,5,6]
##                          ]
##                        ]
##                      ],
##                                            [
##                        [
##                          [[1,2,3],
##                           [4,5,6]],
##                          [[1,2,3],
##                           [4,5,6]]
##                        ],
##                        [
##                          [[1,2,3],
##                           [4,5,6]],
##                          [[1,2,3],
##                           [4,5,6]
##                          ]
##                        ]
##                      ]
##                    ]
##                   )
##puts ''
##print 'Shape: '
##print three.shape
##puts ''
##print three
##puts ''
##print three[0]
##puts ''
##a = [nil, nil]
##b = Ndarray.spread(a, 2)
##print b
##puts ''
##c = Ndarray.spread(b, 2)
##puts ''
##print c


puts ''
t = Ndarray.empty([3,2])
puts ''
print t


puts 'right here'
l = Ndarray.empty([3])
puts 'shape l:'
puts l.shape
print l
puts l.array


b = Ndarray.new([1, 2, 3])
puts ''
puts b.shape
print b

##print "Mult"
##ans = a.multiply(a, a)

##print ans

##print a.shape

##print "A: \n"
##print a
##
##print a.at_i(0)
##print a.at_i(2)
##b = a.dot(a, a)
##
##c = a.zeros([3,3])
##print c
##
##t = a.transpose(a)
##puts
##print t
##
##puts
##print t.shape
##
##print t.transpose(t).shape
##
##a = t
##b = t.transpose(t)
##puts "A"
##print a
##puts "B"
##print b
##puts
##print a.shape
##puts
##print b.shape

##c = a.mul(a,b)
##
##puts "Printing c:"
##print c

##b = Ndarray.new([[7, 8, 9],
#                 [10, 11, 12]])
##print a.add(a,b)

##c = Ndarray.new([[1, 2, 3]])
##d = Ndarray.new([[4, 5, 6]])
##u = c.dot(c, d)
##print u

##a = Ndarray.new([[2, 2],
#                 [2, 2]])
##b = a

##c = a.mul(a, b)
##print c
