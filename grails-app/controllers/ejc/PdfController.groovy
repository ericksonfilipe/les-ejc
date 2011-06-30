package ejc

class PdfController {

    def renderPDF = {
		def usuarioInstance = Usuario.get(params.id)
		if (usuarioInstance?.ficha) {
			response.contentType = "application/pdf"
			response.setContentLength(usuarioInstance.ficha.length)
			response.outputStream.write(usuarioInstance.ficha)
		} else {
			response.sendError(404)
		}
	}
}
