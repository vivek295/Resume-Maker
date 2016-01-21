class Resume
	def initialize
		input
	end

	def input

		print "\n\nAdd Personal Information : \n\n"
		person_info
		print "\n\nAdd Educational Qualification Details: \n"
		@qual=Array.new
		temp="y"
		while !temp.eql?("n") do
			@qual<<Qualification.new
			print "\nDo You want to add more  (y / n) : "
			temp = gets
			temp.chomp!
			temp.strip!
		end 

		@skills=Array.new
		print "\n\nAdd IT Skills : \n"
		temp="y"
		while !temp.eql?("n") do
			@skills<<Skills.new
			print "\nDo You Want to add more (y / n) : "
			temp = gets
			temp.chomp!
			temp.strip!
		end

		@projects=Array.new
		print "\n\nAdd Project Details : \n"
		temp="y"
		while !temp.eql?("n") do 
			@projects<<Projects.new
			print "\nDo You Want to add more ( y / n) : "
			temp = gets.chomp!
			temp.strip!
		end

	end

	def person_info
		begin
			print "Name : "
			@name=gets.chomp!
			@name.strip!
		end while @name.length < 2
		begin 
			print "Email : "
			@email=gets.chomp!
			@email.strip!
		end while @email.length < 5
		begin
			print "Address : "
			@address=gets.chomp!
			@address.strip!
		end while @address.length < 5
		begin
			print "Mobile Number : "
			@mob= gets.chomp!
			@mob.strip!
		end while (@mob.length != 10 or @mob.to_i ==0)
	end

	def disp
		puts "Name = #{@name}"
		puts "Email = #{@email}"
		puts "Address = #{@address}"
		puts "Mobile Number= #{@mob}"
		puts "Qualification :  "
		for i in @qual
			puts "#{i} \n"
		end
		puts "Projects : "
		for i in @projects
			puts "#{i}\n"
		end
		puts "IT Skills : "
		for i in @skills
			print "#{i} , "
		end
	end

	def file_write
		aFile = File.open(@name+".txt", "w+")
		if aFile
			aFile.syswrite("Personal Details : \n")
			aFile.syswrite("-----------------\n\n")
   			aFile.syswrite("Name : #{@name}\n")
   			aFile.syswrite("E.Mail : #{@email}\n")
   			aFile.syswrite("Address : #{@address}\n")
   			aFile.syswrite("Phone : #{@mob}\n\n")
   			aFile.syswrite("Education Details : \n")
   			aFile.syswrite("-------------------\n\n")
   			for i in @qual
				aFile.syswrite("#{i} \n\n")
			end

			aFile.syswrite("\nIT Skills : \n")
			aFile.syswrite("-----------\n\n")
			for i in @skills
				aFile.syswrite "#{i} , "
			end
			aFile.syswrite("\n\nProjects : \n")
			aFile.syswrite("----------\n\n")
			for i in @projects
				aFile.syswrite "#{i}\n"
			end

   		else
   			puts "Unable to open file!"
		end
	end
end


class Qualification
	def initialize
		qual		
	end

	def qual
		begin
		print "\nCourse : "
		@degree=gets.chomp!
		@degree.strip!
		end while @degree.length < 2

		begin
		print "Board / University : "
		@board=gets.chomp!
		@board.strip!
		end while @board.length < 2

		begin
		print "Year of completion : "
		@yoc=gets.chomp!
		@yoc.strip!
		end while (@yoc.length != 4 or @yoc.to_i > 2016)

		begin
		print "Percent/CGPA : "
		@marks=gets.chomp!
		@marks.strip!
		end while @marks.to_i > 100
	end

	def to_s
		return "Course :#{@degree}\nBoard /University : #{@board}\nYear Of Completion : #{@yoc}\nMarks/CGPA : #{@marks}"
	end
end

class Skills
	def initialize
		add_skill		
	end

	def add_skill
		begin
			print "\nSkill : "
			@skill=gets.chomp!
			@skill.strip!
		end while @skill.length < 1
		
	end

	def to_s
		return "#{@skill}"
	end
end

class Projects
	def initialize
		add_project		
	end

	def add_project
		begin
			print "\nProject Title : "
			@pname=gets.chomp!
			@pname.strip!
		end while @pname.length < 5

		begin
			print "Platform Used : "
			@pused=gets.chomp!
			@pused.strip!
		end while @pused.length < 4

		begin
			print "Project Duration : "
			@pdur=gets.chomp!
			@pdur.strip!
		end while @pdur.length < 1

		begin
			print "Your role in the Project : "
			@prole=gets.chomp!
			@prole.strip!
		end while @prole.length <2
	end

	def to_s
		return "Title: #{@pname}\nPlatform Used : #{@pused}\nDuration : #{@pdur}\nRole Played : #{@prole}"
	end
end




ob=Resume.new()

ob.disp()
ob.file_write