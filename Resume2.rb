require 'csv'
class Resume
	attr_accessor :information,:skill, :qualification, :projects

	class<<self
		def build(options = {media:[]})
			resume=self.new
			resume.information=Hash.new
			resume.skill=Hash.new
			resume.qualification=Hash.new
			resume.projects=Hash.new
			resume.input_personal_info
			resume.input_skills
			resume.input_qualification
			resume.input_projects
			medias = options[:media]
			medias.each do |media|
        med = eval("#{media.capitalize}File").new
        med.data(resume)
        med.make
      end
		end
	end

	def input_personal_info
		puts "Name : "
		self.information["Name"]=gets.strip
		puts "Email : "
		self.information["Email"]=gets.strip
		puts "Phone : "
		self.information["Phone"]=gets.strip
		puts "Address : "
		self.information["Address"]=gets.strip

	end

	def input_skills
		puts "Skills : "
		self.skill["languages_known"]=gets.strip
	end

	def input_qualification
		puts "Course : "
		self.qualification["Course"]=gets.strip
		puts "Board / University"
		self.qualification["Board/University"]=gets.strip
		puts "Year of Passing : "
		self.qualification["year"]=gets.strip
		puts "CGPA / Marks : "
		self.qualification["CGPA/Marks"]=gets.strip
	end

	def input_projects
		puts "Project Title : "
		self.projects["Title"]=gets.strip
		puts "Platform Used : "
		self.projects["Platform Used"]=gets.strip
		puts "Duration : "
		self.projects["Duration"]=gets.strip
	end
end

class BuildData
	attr_accessor :result, :csv_data

		def data(resume_object)
			@result=""
			@csv_data=""
			(resume_object.information).each {
				|key,value|
					@csv_data += key +" , "+value+"\n"
					@result += key + " : "+ value+"\n"
			}
			@csv_data += " \n "
			@result += "\n"
			(resume_object.skill).each {
				|key,value|
					@csv_data += key + " , " + value+"\n"
					@result += key + " : "+ value+"\n"
			}
			@csv_data += " \n "
			@result += "\n"
			(resume_object.qualification).each {
				|key,value|
					@csv_data += key + " , " + value+"\n"
					@result += key + " : "+ value+"\n"
			}
			@csv_data += " \n "	
			@result += "\n"
			(resume_object.projects).each {
				|key,value|
					@csv_data += key +" , " + value+"\n"
					@result += key + " : "+ value+"\n"
			}

			result
	end
end
 
class CsvFile < BuildData

		def make
			newFile=File.open("Demo.csv","w")
			newFile.syswrite(self.csv_data)
		end
end

class TextFile < BuildData
	def make
		newFile=File.open("Demo.txt","wb")
		newFile.syswrite(self.result)
	end
end

class PdfFile < BuildData
	def make
		require 'prawn'
		Prawn::Document.generate("test.pdf") do
			font "#{Prawn::BASEDIR}/data/fonts/DejaVuSans.ttf"
			text(result)
		end
	end
end

Resume.build({media: ["text","csv"]})