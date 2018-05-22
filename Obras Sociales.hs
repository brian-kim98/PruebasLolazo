
type Enfermedad = String
type Peso = Float
type Edad = Int
type Costo = Float
type Sesiones = Int

data Sexo = Masculino | Femenino deriving Show

data Socio = Socio {
sexo :: Sexo,
peso :: Peso,
edad :: Edad,
preexistencias :: [Enfermedad]
} deriving (Show)

data Tratamiento = Tratamiento {
costoBase :: Costo,
sesiones :: Sesiones,
enfermedad :: Enfermedad
} deriving (Show)

jose = Socio {
sexo = Masculino,
peso = 78.9,
edad = 22,
preexistencias = ["zamorreaDistopica"]
}

analía = Socio {
sexo = Femenino,
peso = 70.0,
edad = 34,
preexistencias = []
}

x1 = Tratamiento {
costoBase = 5000.0,
sesiones = 30,
enfermedad = "zamorreaDistopica"
}

xfg23 = Tratamiento {
costoBase = 10000.0,
sesiones = 2,
enfermedad = "zamorreaDistopica"
}

agregarPreexistencias :: [Enfermedad] -> Socio -> Socio
agregarPreexistencias unasPreexistencias unSocio = unSocio {
preexistencias = unasPreexistencias
}

agregarNuevaPreexistencia :: Socio -> Enfermedad -> Socio
agregarNuevaPreexistencia nuevaPreexistencia unSocio = agregarPreexistencias (nuevaPreexistencia : preexistencias unSocio) unSocio

diagnosticarPreexistencia :: Enfermedad -> Socio -> Socio
diagnosticarPreexistencia = agregarNuevaPreexistencia

estaEnRiesgo :: Socio -> Bool
estaEnRiesgo unSocio = esObeso unSocio ||  tieneEdadAvanzada unSocio  || tieneMuchasPreexistencias unSocio

esObeso = (> 150) . peso

tieneEdadAvanzada = (> 75). edad

tieneMuchasPreexistencias = tieneMasDeNPreexistencias 8
tieneMasDeNPreexistencias n = (> n) . length . preexistencias
----------------------------------------------------------------------------------------------------------------

data Solicitud = Solicitud {
socio :: Socio,
tratamiento :: Tratamiento
} deriving Show

solicitud897 = Solicitud {
socio = jose,
tratamiento = x1
}

type Dinero = Float
type Cobertura = Dinero
type Prestacion = Solicitud -> Cobertura

prestacionTotal :: Enfermedad -> Prestacion
prestacionTotal unaEnfermedad unaSolicitud
 | enfermedadDeSolicitud unaSolicitud == unaEnfermedad = costoDeSolicitud unaSolicitud
 | otherwise = 0

costoDeSolicitud = costoBase . tratamiento

enfermedadDeSolicitud = enfermedad . tratamiento
 

prestacionSinPreexistencias :: Prestacion
prestacionSinPreexistencias unaSolicitud 
 | laEnfermedadNoEsPreexistente (enfermedadDeSolicitud unaSolicitud) (socio unaSolicitud) = costoDeSolicitud * 0.50
 | otherwise = 0 


laEnfermedadNoEsPreexistente enEnfermedad  = 
 not . laEnfermedadEsPreexistente unaEnfermedad

laEnfermedadEsPreexistente unaEnfermedad = 
 elem unaEnfermedad . preexistencias

 
prestacionHastaMaximo :: Dinero -> Prestacion
prestacionHastaMaximo maximo = min maximo . costoDeSolicitud

nada :: Prestacion
nada _ = 0

----------------------------------------------

sumarPrestaciones :: Prestacion -> Prestacion -> Prestacion
sumarPrestaciones prestacion1 prestacion2 unaSolicitud = max (prestacion1 unaSolicitud)(prestacion2 unaSolicitud)

plan  = foldr sumarPrestaciones nada unaListaDePrestaciones






















