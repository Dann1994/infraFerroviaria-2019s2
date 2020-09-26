import vagones.*
import locomotoras.*
   
class Formacion {
	 const vagones = []
	 const locomotoras = []
	 
	 method agragarLocomotora(unaLocomotora) {locomotoras.add(unaLocomotora)}
	 method capacidad() = vagones.sum({ vagon => vagon.capacidad()})
	 method vagonespapulares() = vagones.count({ vagon => vagon.capacidad() > 50 })
	 method esCarguera() = vagones.all({ vagon => vagon.cargaMax() >= 1000 })
	 
	 method vagonMasPesado()  = vagones.max({ vagon => vagon.pesoMax() })
	 method vagonMasLiviano() = vagones.min({ vagon => vagon.pesoMax() })
	 method dispersionPesos() = self.vagonMasPesado().pesoMax() - self.vagonMasLiviano().pesoMax()
	 
	 method cantBanios() = vagones.count({ vagon => vagon.tienenBanios() })
	 
	 
	 method hacerMantenimiento() {
	 	vagones.forEach({ vagon => vagon.hacerMantenimiento() })
	 }
	 
	 method conPasajeros() = vagones.filter({ vagon => vagon.capacidad() > 0 })
	 method sinPasajeros() = vagones.filter({ vagon => vagon.capacidad() == 0 })
	 method vagonMayorCapacidad() = self.conPasajeros().max({ vagon => vagon.capacidad() })
	 method vagonMenorCapacidad() = self.conPasajeros().min({ vagon => vagon.capacidad() })
	 method estaEquilibrada() = self.vagonMayorCapacidad() - self.vagonMenorCapacidad()
	 
	 method estaOrganizada() {
	 	const orden = []
	    orden.addAll(self.conPasajeros())
	    orden.addAll(self.sinPasajeros())
	    return orden == vagones
	 }
	 
	 method velMax() = locomotoras.min({ locomotora => locomotora.velMax() })
	 method esEficiente() = locomotoras.all({ locomotora => locomotora.esEficiente() })
	 
	 method pesoDeFormacion() = vagones.sum({ vagon => vagon.pesoMax() }) + locomotoras.sum({ locomotora => locomotora.peso() })
	 method arrastreTotal() = locomotoras.sum({ locomotora => locomotora.arrastre() })
	 method puedeMoverse() = self.arrastreTotal() >= self.pesoDeFormacion()
	 method kilosDeEmpujeQueFaltan() = 0.max( self.pesoDeFormacion() - self.arrastreTotal() )
	 method esCompleja() = vagones.size() + locomotoras.size() > 8 || self.pesoDeFormacion() > 80000
	 method reforzarFormacion() { 
	 	if (not self.puedeMoverse()) {
	 		
	 	}
	 }
}
