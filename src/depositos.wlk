import formaciones.*

class Depositos {
	const formaciones = []
	const locomotoras = []
	
	method agregarFormacion(unaFormacion) { formaciones.add(unaFormacion) }
	method agragarLocomotora(unaLocomotora) { locomotoras.add(unaLocomotora) }
	method vagonesMasPesados() = formaciones.filter({ formacion => formacion.vagonMasPesado() }).asSet()
	method necesitaConductorExper() = formaciones.any({ formacion => formacion.esCompleja() })
	method locomotoraArrastreMayor(kg) = locomotoras.find({ locomotora => locomotora.arrastre() > kg })
	method locomotoraNecesaria(unaFormacion) = locomotoras.first({ locomotora => locomotora.arrastre() > unaFormacion.pesoDeFormacion()  })       
	method locomotoraPara(unaFormacion) {
		if (not unaFormacion.puedeMoverse()) {
			unaFormacion.agragarLocomotora(self.locomotoraNecesaria(unaFormacion))
		}
	}
}
