class Resume
	attr_accessor :name,:email,:address,:mob,:qual,:skills,:about
	class << self
		def build
			resume = new
			resume.name = resume.input_name
			resume.email = resume.input_email
			resume.address = resume.input_address
			resume.mob = resume.input_mob
			resume.qual = resume.input_qual
			resume.skills = resume.input_skills
			resume.about = resume.input_about
			resume.write_cv
		end
	end

	def input_name
		begin
			puts "Enter Name : "
			name = gets.strip
		end while name.length < 2
		name
	end

	def input_email
		begin
			puts "Enter Email : "
			email = gets.strip
		end while email.length < 5
		email
	end

	def input_address
		begin
			puts "Enter Address : "
			address = gets.strip
		end while address.length < 5
		address
	end


	def input_mob
		begin
			puts "Enter Mobile number : "
			mob = gets.strip
		end while mob.length != 10 or mob.to_i == 0
		mob
	end

	def input_qual
		begin
			print "\nCourse : "
			degree = gets.strip
		end while degree.length < 2

		begin
			print "Board / University : "
			board = gets.strip
		end while board.length < 2

		begin
			print "Year of completion : "
			yoc = gets.strip
		end while (yoc.length != 4 or yoc.to_i > 2016)

		begin
			print "Percent/CGPA : "
			marks = gets.strip
		end while marks.to_f > 100

		return "Degree : #{degree}\nBoard : #{board}\nyear of completion #{yoc}\nPer./CGPA : #{marks}"
	end

	def input_skills
		begin
			print "Enter Skills : "
			skills = gets.strip
		end while skills.length < 5
		skills
	end

	def input_about
		begin
			print "About You : "
			about = gets.strip
		end while about.length < 5
		about
	end

	def write_cv
		myFile = File.open(self.name+".txt","w")
		data="Name : #{name}\nEmail : #{email}\nAddress : #{address}\nMobile : #{mob}\n"+
			 "\nEducational Qualification : \n#{qual}\n\nSkills :\n#{skills}\n\nAbout : #{about}\n"
		myFile.syswrite(data)
	end
end

Resume.build