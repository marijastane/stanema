from django.db.models import Model, ManyToManyField, CharField, IntegerField, TextField, EmailField, DateTimeField, \
    DecimalField, ImageField


class Customer(Model):
    first_name = CharField(max_length=50)
    last_name = CharField(max_length=50, null=True)
    email = EmailField(max_length=50, null=True)
    gender = CharField(verbose_name='gender', max_length=15, choices=[('male', 'male'), ('female', 'female')],
                       null=True)
    created = DateTimeField(auto_now_add=True)


class Product(Model):
    title = CharField(max_length=50)
    price = DecimalField(decimal_places=2, max_digits=10)
    description = TextField()
    image = ImageField(name='painting_image')


class Storage(Model):
    product_storage = ManyToManyField(Product)
    quantity = IntegerField()


class Shop(Model):
    address = CharField(max_length=50)
    shop_storage = ManyToManyField(Storage)


class Cart(Model):
    product = ManyToManyField(Product)
    quantity = IntegerField()


class Orders(Model):
    customer = ManyToManyField(Customer)
    cart = ManyToManyField(Cart)
    created = DateTimeField(auto_now_add=True)


