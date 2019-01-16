def frame_score(x)
  @score = 0

  x.each_with_index do |(f, s, t), index|
   
    #iterates through frames 1-9
    if index < x.length - 1
      
      p "Frame #{index+1}"
      
      #checks to see if first throw (f) is a strike
      if f == 10
        #this checks to see if next throw is a strike
        x[index+1][1] == nil ? y = 10 + x[index+1][0].to_i + x[index+2][0].to_i : y = 10 + x[index+1][0].to_i + x[index+1][1].to_i
        
        p "X"
        #adds 10 plus the next two throws
        @score += y
      
      #checks to see if a spare is thrown
      elsif f+s.to_i == 10
        y = 10 + x[index+1][0].to_i
        p "#{f} /" 
        @score += y
      
      #otherwise just adds the two throws to the total score
      else
        p "#{f} #{s}"
        @score += f + s
      end
   
    #when it gets to the last frame
    else
      p "Frame #{index+1}"
      
      #when all three throws are strikes
      if f+s+t.to_i == 30
        @score += 30
        p 30
      
      #when the first two throws are strikes
      elsif f+s == 20
        @score += 20
        p 20 
     
      #when a spare is thrown
      elsif f+s == 10
        @score += 10 + t*2
        p 10 + t*2
      
      #otherwise add the two throws to the total score
      else
        @score += f+s
        p f+s
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

    throw_1 = Integer(gets.chomp)

    if throw_1 == 10
      p "Nice strike!"
      @scores.push([throw_1])
      @frame += 1

    else
      p "Second throw: "
      throw_2 = Integer(gets.chomp)
      @scores.push([throw_1, throw_2])
      @frame += 1

    end
  end

  p "Frame 10. First throw: "
  throw_1 = Integer(gets.chomp)

  p "Second throw: "
  throw_2 = Integer(gets.chomp)

  if throw_1 + throw_2 == 10
    p "Nice spare on the last frame! Final throw: "
    throw_3 = Integer(gets.chomp)
    @scores.push([throw_1, throw_2, throw_3])

  elsif throw_1 + throw_2 == 20
    p "Wow, two strikes! Final throw: "
    throw_3 = Integer(gets.chomp)
    @scores.push([throw_1, throw_2, throw_3])

  else
    @scores.push([throw_1, throw_2])
    
  end
  p @scores
  frame_score(@scores)
end

get_scores
