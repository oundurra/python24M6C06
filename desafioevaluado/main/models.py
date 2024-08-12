# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class Profesor(models.Model):
    rut = models.CharField(primary_key=True, max_length=9)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    activo = models.BooleanField(default=False)
    creacion_registro = models.DateField()
    modificacion_registro = models.DateField()
    creado_por = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'profesor'

class Curso(models.Model):
    codigo = models.CharField(primary_key=True, max_length=10)
    nombre = models.CharField(max_length=50)
    version = models.IntegerField()
    profesores = models.ManyToManyField(Profesor, related_name="profesores")

    class Meta:
        managed = False
        db_table = 'curso'

class Estudiante(models.Model):
    rut = models.CharField(primary_key=True, max_length=9)
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    fecha_nac = models.DateField()
    activo = models.BooleanField(default=False)
    creacion_registro = models.DateField()
    modificacion_registro = models.DateField()
    creado_por = models.CharField(max_length=50)
    cursos = models.ManyToManyField(Curso, related_name="cursos")

    class Meta:
        managed = False
        db_table = 'estudiante'

class Direccion(models.Model):
    id = models.AutoField(primary_key=True)
    calle = models.CharField(max_length=50)
    numero = models.CharField(max_length=10)
    dpto = models.CharField(max_length=10, null=True)
    comuna = models.CharField(max_length=50)
    ciudad = models.CharField(max_length=50)
    region = models.CharField(max_length=50)
    estudiante = models.OneToOneField(Estudiante, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'direccion'


class CursoProfesores(models.Model):
    curso = models.ForeignKey(Curso, models.DO_NOTHING)
    profesor = models.ForeignKey(Profesor, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'curso_profesores'
        unique_together = (('curso', 'profesor'),)


class EstudianteCursos(models.Model):
    estudiante = models.ForeignKey(Estudiante, models.DO_NOTHING)
    curso = models.ForeignKey(Curso, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'estudiante_cursos'
