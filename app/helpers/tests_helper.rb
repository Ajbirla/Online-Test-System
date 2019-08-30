module TestsHelper
   def get_test_time
       if @ans != [] && @ans.first.spend_time.to_i.present?
         (@test.duration.strftime("%M").to_i*60)-@ans.first.spend_time
      else
         (@test.duration.strftime("%M").to_i*60)
      end
   end
end
