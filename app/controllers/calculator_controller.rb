class CalculatorController < ApplicationController
    before_action :parse, only: :output
def answer(arg)
  arr = arg.split(' ')
  arr.map!{|x| x.to_i}
  @result=func(arr)
 end

 def func(a)
   resarr = []
   s = 0
   sm = []
   d = a[0]
   k = 1
   a.each_index do |i|
     if (i != 0) && (a[i] > d) && (i != (a.length - 1))
       sm.push(a[i])
       s += 1
     elsif (i == 0) && (a[1] > a[0])
       sm.push(a[i])
       s += 1
     elsif (a[i] <= d) && (s > 0)
       resarr.push.push(sm)
       sm = [a[i]]
       s = 0
     elsif (i == (a.length - 1)) && (a[i] > d)
       sm.push(a[i])
       resarr.push.push(sm)
     end
     d = a[i]
   end

   resarr = resarr.sort { |a, b| b.length <=> a.length }

 resarr
 end

  def input
  end

  def add_to_db(arg)
      new_result = Result.create(param: @param.to_s, res: @result.to_s)
  end

  def output
    if Result.find_by(param: "#{@param}") == nil
        answer(@param)
        add_to_db(@result)
    else
        tmp_res = Result.find_by(param: @param)
        @result = tmp_res.res[1..-1].split(' ').map {|elem| elem.to_i}
    end
  end

  def parse
      @param = params[:param]
  end

end
