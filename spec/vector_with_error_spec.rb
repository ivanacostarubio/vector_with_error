class Vector

  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def compare_with_error(y,tolerance)
    !y.data.each_with_index.map{|number,index| within(number,@data[index],tolerance) }.include? false
  end

  private
  def within(x,y,tolerance)
    return true if x.between?(y - tolerance, y)
    return true if x.between?(y, y + tolerance)
    false
  end
end

describe Vector do

  let(:x) {  Vector.new([1,2,3]) }


  it "is the same" do
    Vector.new([1,2,3]).compare_with_error(x,0).should == true
  end

  it "can compare with an error rate" do
    Vector.new([1.1,1.9,3.1]).compare_with_error(x,0.1).should == true
    Vector.new([1.1,1.9,3.1]).compare_with_error(x,0.0).should == false
  end
end
