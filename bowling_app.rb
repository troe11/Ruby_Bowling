def frame_score(x)
  @score = 0
 
  x.each_with_index do |(f, s, t), index|
    f = f.to_s
    s = s.to_s
    t = t.to_s
    #iterates through frames 1-9
    if index < x.length - 1
     
      p "Frame #{index+1}"
      #checks to see if first throw (f) is a strike
      if f.to_i == 10 || f.downcase == "x"
        #this checks to see if next throw is a strike
        n = x[index+1][0].to_s
        
        
        if n.downcase == "x" || n.to_i == 10
          if index == 8
            w = x[index+1][1].to_s
            if w.downcase == "x" || w.to_i == 10
              y = 30
              @score += y
            else
              y = 20 + w.to_i
              @score += y
            end
            p y
          else
            w = x[index+2][0].to_s
            if w.downcase == "x" || w.to_i == 10
              y = 30
              @score += y
            else
              y = 20 + w.to_i
              @score += y
            end 
            p y
          end
          p @score
          
        else
          q = x[index+1][1]
          y = 10 + q.to_i + w.to_i
        end
        p "X"
        #adds 10 plus the next two throws
     
      #checks to see if a spare is thrown
      elsif f.to_i+s.to_i == 10
        y = 10 + x[index+1][0].to_i
        p "#{f} /"
        @score += y
     
      #otherwise just adds the two throws to the total score
      else
        p "#{f} #{s}"
        @score += f.to_i + s.to_i
      end
  
    #when it gets to the last frame
    else
      p "Frame #{index+1}"
      
      #when all three throws are strikes
      if f.to_i+s.to_i+t.to_i == 30 || f.downcase == "x" && s.downcase == "x" && t.downcase == "x"
        @score += 30
        p 30
     
      #when the first two throws are strikes
      elsif f.to_i+s.to_i == 20 || f.downcase == "x" && s.downcase == "x"
        @score += 20
        p 20
    
      #when a spare is thrown
      elsif f.to_i+s.to_i == 10 || s == "/"
        @score += 10 + t*2
        p 10 + t*2
     
      elsif f.to_i == 10 || f.downcase == "x"
        if f.to_i+s.to_i == 10 || s == "/"
          @score += 20
          p 20
        else 
          @score += 10 + s.to_i + t.to_i
          p 10 + s.to_i + t.to_i
        end
      #otherwise add the two throws to the total score
      else
        @score += f.to_i+s.to_i
        p f.to_i+s.to_i
      end
    end
  end
  p "Total score: #{@score}"
 end
 
 def get_scores
 
  @frame = 1
  @scores = []
  p "Welcome to the Bowling Score App!"
  p "You will be asked to input scores throw by throw. The app will then magically calculate your final score. Here we go!"
  while @frame < 10
   
    p "Frame #{@frame}. First throw: "
 
    throw_1 = gets.chomp
      
      if !!(throw_1 =~ /[a-z]/) && throw_1.downcase != "x"
          p "Not a valid input. Please try again."
              get_scores
      else
        if throw_1.downcase == "x" || throw_1.to_i == 10
        p "Nice strike!"
        @scores.push([throw_1])
        @frame += 1

        else

          p "Second throw: "
          throw_2 = gets.chomp
  
          if throw_1.to_i + throw_2.to_i == 10 || throw_2 == "/"
              p "Nice Spare!"
              @scores.push([throw_1, "/"])
              @frame += 1
          else
              @scores.push([throw_1.to_i, throw_2.to_i])
              @frame += 1
          end
        end  
      end
  end
 
  p "Frame 10. First throw: "
  throw_1 = gets.chomp
  
  p "Second throw: "
  throw_2 = gets.chomp
 
  if throw_1.to_i + throw_2.to_i == 10 || throw_2.downcase == "/"
    p "Nice spare on the last frame! Final throw: "
    throw_3 = gets.chomp
    @scores.push([throw_1, throw_2, throw_3])
 
  elsif throw_1.to_i + throw_2.to_i == 20 || throw_1.downcase == "x" && throw_2.downcase == "x"
    p "Wow, two strikes! Final throw: "
    throw_3 = gets.chomp
    @scores.push([throw_1, throw_2, throw_3])

  elsif throw_1.to_i == 10 || throw_1.downcase == "x"
    p "Final throw: "
    throw_3 = gets.chomp
    if throw_3.to_i + throw_2.to_i == 10 || throw_3.downcase == "/"
      @scores.push([throw_1, throw_2, "/"])
    else
      @scores.push([throw_1.to_i, throw_2.to_i])
    end
  else
    @scores.push([throw_1.to_i, throw_2.to_i])
   
  end
  p @scores
  frame_score(@scores)
end

get_scores


 
 
