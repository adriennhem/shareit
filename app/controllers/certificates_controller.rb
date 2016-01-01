class CertificatesController < ApplicationController
	def show
	@lecture = Lecture.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "certificate", 
        	   template: "certificates/certificate.html.erb",   # Excluding ".pdf" extension.
        	   orientation:     "Landscape",
        	    page_height:  250,
        	    page_width: 150
      end
    end
  end
end
