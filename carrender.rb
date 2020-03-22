#カレンダークラスを作ってメソッドを作成したい
#テストも書く minitestでいいから
#MVCモデル完成
#Date.new(2020,3,-1)　これで今月の月末を取得できる
#Date.new(2020,3,1)　これで初日の取得
#wdayメソッドで曜日を数値で取得できる月曜が1
require 'date'
def set_month
  @today = Date.today
end
#Cの役割になる
def main
    #Mの役割になる
    set_month
    month_year = get_this_month_year
    weeks = get_weeks
    days = get_days
    
    #viewの役割になる
    puts month_year
    puts weeks
    puts days
end 

def get_this_month_year
 months = { 1=> "January", 2=> "February", 3=> "March", 4=> "April", 5=> "May",6=> "Jun",7=> "July",8 => "August", 9=> "September", 10=> "October", 11=> "November", 12=> "December" }
 this_month = months[@today.mon]
 this_year = @today.year
 this_month_year = this_month.to_s + " " + this_year.to_s
 this_month_year
end

def get_weeks
  weeks = ['Su', 'Mo', 'Tu', 'We', 'Th' ,'Fr', 'Sa']
  weeks.join(' ')
end

def get_days
  last_day_of_this_month = Date.new(@today.year,@today.mon,-1)
  start_day_of_this_month = Date.new(@today.year,@today.mon,1)
  #今月の全ての日にちの範囲オブジェクト
  all_days = (start_day_of_this_month .. last_day_of_this_month)  
  days = []
  #最初の日にちの曜日に揃える
  start_day_of_this_month.wday.times do 
    days << '   '
  end 
  
  all_days.each do |day|
    if day.saturday?
      days << day.day.to_s.rjust(2) 
      days << " "
      days << "\n"
    else 
     days << day.day.to_s.rjust(2)
     days << " "
    end
  end
  
  days.join('')
  
end

if __FILE__ == $0
  main
end











