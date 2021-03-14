from django.db.models import Model, ManyToManyField, CharField, IntegerField, TextField, EmailField, DateTimeField, \
    DecimalField


class Customer( Model ):
    first_name = CharField( max_length=50 )
    last_name = CharField( max_length=50, null=True )
    email = EmailField( max_length=50, null=True )
    gender = CharField( verbose_name='gender', max_length=15, choices=[('male', 'male'), ('female', 'female')],
                        null=True )
    created = DateTimeField( auto_now_add=True )


