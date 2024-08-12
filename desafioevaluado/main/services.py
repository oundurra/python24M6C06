from .models import *
from datetime import date

def crear_profesor(rut, nombre, apellido, creado_por):
    profesor = Profesor()
    profesor.rut = rut
    profesor.nombre = nombre
    profesor.apellido = apellido
    profesor.creado_por = creado_por
    profesor.creacion_registro = date.today()
    profesor.modificacion_registro = date.today()
    profesor.save()

def crear_curso(codigo, nombre, version, profesor_id):
    curso = Curso()
    curso.codigo = codigo
    curso.nombre = nombre
    curso.version = version
    curso.save()
    curso.profesores.add(Profesor.objects.get(rut=profesor_id))

def crear_estudiante(rut, nombre, apellido, fecha_nac, creado_por, curso_id):
    estudiante = Estudiante()
    estudiante.rut = rut
    estudiante.nombre = nombre
    estudiante.apellido = apellido
    estudiante.fecha_nac = fecha_nac
    estudiante.creado_por = creado_por
    estudiante.creacion_registro = date.today()
    estudiante.modificacion_registro = date.today()
    estudiante.save()
    estudiante.cursos.add(Curso.objects.get(codigo=curso_id))

def crear_direccion(calle, numero, dpto, comuna, ciudad, region, estudiante_id):
    direccion = Direccion()
    direccion.calle = calle
    direccion.numero = numero
    direccion.dpto = dpto
    direccion.comuna = comuna
    direccion.ciudad = ciudad
    direccion.region = region
    direccion.estudiante = Estudiante.objects.get(rut=estudiante_id)
    direccion.save()

def obtiene_estudiante(estudiante_id):
    return Estudiante.objects.get(rut=estudiante_id)

def obtiene_profesor(profesor_id):
    return Profesor.objects.get(rut=profesor_id)

def obtiene_curso(curso_id):
    return Curso.objects.get(codigo=curso_id)

def agrega_profesor_a_curso(profesor_id, curso_id):
    curso = Curso.objects.get(codigo=curso_id)
    curso.profesores.add(Profesor.objects.get(rut=profesor_id))

def agrega_cursos_a_estudiante(estudiante_id, curso_id):
    estudiante = Estudiante.objects.get(rut=estudiante_id)
    estudiante.cursos.add(Curso.objects.get(codigo=curso_id))

def imprime_estudiante_cursos(estudiante_id):
    cursos = Estudiante.objects.get(pk=estudiante_id).cursos.all()
    
    for curso in cursos:
        print(curso.codigo + " " + curso.nombre)