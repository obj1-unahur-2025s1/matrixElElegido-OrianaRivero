object neo{
    var energia = 100
    method esElElegido() = true
    method energia() = energia
    method saltar(){
        energia = energia / 2
    }
    method vitalidad() = energia / 10
    
}

object morfeo{
    var vitalidad = 8
    var estaDescansado = true
    method esElElegido() = false
    method saltar(){
        estaDescansado = !estaDescansado
        vitalidad = (vitalidad-1).max(0)
    }
    method vitalidad() = vitalidad
    method descansado() = estaDescansado
}

object trinity{
    method esElElegido() = false

    method saltar() {}
    method vitalidad() = 0
}

object nave{
    const pasajeros = #{neo, trinity, morfeo}
    method pasajeros() = pasajeros

    method cuantosPasajerosHay(){
        return pasajeros.size()
    }
    method elDeMayorVitalidad(){
        return
            pasajeros.max({p => p.vitalidad()})
    }
    method elDeMenorVitalidad(){
        return
            pasajeros.min({p => p.vitalidad()})
    }
    method estaEquilibradaEnVitalidad() {
        return 
            self.elDeMayorVitalidad().vitalidad() 
            < 
            self.elDeMenorVitalidad().vitalidad() *2
    }
    method estaElElegido(){
        return pasajeros.any({p=> p.esElElegido()})
    }
    method chocar(){
        pasajeros.forEach({p=>p.saltar()})
        pasajeros.clear()
    }
    method acelerar(){
        pasajeros.filter({p=> !p.esElElegido()}).forEach({p=>p.saltar()})
        pasajeros.remove(pasajeros.find({p=>p.esElElegido()}))
    }
}

