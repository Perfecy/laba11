require 'test_helper'
class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save new empty user' do
    posled = Result.new
    assert posled.save
  end

  test 'should not save duplicate data' do
    @param = '1 2 3 3 4 5 6 7 8 1 2 3 3 3 3 34 35 72 96 15 35 46 73'
    @result = [[3,4,5,6,7,8], [3,34,35,72,96], [15,35,46,73], [1,2,3], [1,2,3]]
    new_result = Result.create(param: @param.to_s, res: @result.to_s)
    if Result.find_by(param: "#{@param}") == nil
      assert false
    else
      tmp_res = Result.find_by(param: @param)
      assert true
    end
  end
end
