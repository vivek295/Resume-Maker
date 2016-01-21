class Resume
	attr_accessor :name,:email,:address,:mob,:qual,:skills,:about
	class << self
		def build
			ob = new
			ob.name = ob.input_name
			ob.email = ob.input_email
			ob.address = ob.input_address
			ob.mob= ob.input_mob
			ob.qual=ob.input_qual
			ob.skills=ob.input_skills
			ob.about=ob.input_about
			ob.write_cv
		end
	end

	def input_name
		begin
			puts "Enter Name : "
			name=gets
			name.strip!
		end while name.length < 2
		return name
	end

	def input_email
		begin
			puts "Enter Email : "
			email=gets
			email.strip!
		end while email.length < 5
		return email
	end

	def input_address
		begin
			puts "Enter Address : "
			address=gets
			address.strip!
		end while address.length < 5
		return address
	end


	def input_mob
		begin
			puts "Enter Mobile number : "
			mob=gets
			mob.strip!
		end while mob.length != 10 or mob.to_i == 0
		return mob
	end

	def input_qual
		begin
			print "\nCourse : "
			degree=gets
			degree.strip!
		end while degree.length < 2

		begin
			print "Board / University : "
			board=gets
			board.strip!
		end while board.length < 2

		begin
			print "Year of completion : "
			yoc=gets
			yoc.strip!
		end while (yoc.length != 4 or yoc.to_i > 2016)

		begin
			print "Percent/CGPA : "
			marks=gets
			marks.strip!
		end while marks.to_i > 100

		return "Degree : #{degree}\nBoard : #{board}\nyear of completion #{yoc}\nPer./CGPA : #{marks}"
	end

	def input_skills
		begin
			print "Enter Skills : "
			skills=gets.strip
		end while skills.length < 5
		return skills
	end

	def input_about
		begin
			print "About You : "
			about=gets
			about.strip
		end while about.length < 5
	end

	def write_cv
		myFile= File.open(self.name+".txt","w")
		myFile.syswrite("#{name}\n#{email}\n#{address}\n#{mob}\n\n#{qual}\n\nSkills :\n#{skills}\n\nAbout : #{about}\n")
	end
end

Resume.build