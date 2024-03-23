from .models import Utilisateur
from rest_framework import serializers


class UserCreationSerializer(serializers.ModelSerializer):

    username = serializers.CharField()
    first_name = serializers.CharField( )
    last_name = serializers.CharField( )
    niveau = serializers.CharField(  )
    genre = serializers.CharField( )
    date_de_naissance = serializers.DateField(  )
    email = serializers.CharField()
    password = serializers.CharField( )
    telephone = serializers.CharField()
    dernier_diplome = serializers.CharField( )
    serie = serializers.CharField()
    photo_de_profil = serializers.ImageField()
    centres_interet = serializers.CharField()



    class Meta:
        model = Utilisateur
        fields = ['username','first_name','last_name','niveau','genre','date_de_naissance','email','password','telephone','dernier_diplome', 'serie','photo_de_profil','centres_interet']


    def validate(self,attrs):

        email_exists = Utilisateur.objects.filter(email=attrs['email']).exists()

        if email_exists:
            raise serializers.ValidationError(detail="User with email already exits ")

        username_exists = Utilisateur.objects.filter(username=attrs['username']).exists()

        if username_exists:
            raise serializers.ValidationError(detail="User with username already exits ")


        return super().validate(attrs)

    def create(self,validated_data):



        user = Utilisateur.objects.create(
            username=validated_data['username'],
            first_name = validated_data['first_name'],
            last_name = validated_data['last_name'],
            email = validated_data['email'],
            niveau = validated_data['niveau'],
            genre = validated_data['genre'],
            date_de_naissance = validated_data['date_de_naissance'],
            telephone = validated_data['telephone'],
            is_active = True,
            serie = validated_data['serie'],
            dernier_diplome = validated_data['dernier_diplome'],
            photo_de_profil = validated_data['photo_de_profil'],
            centres_interet = validated_data['centres_interet']

        )

        user.set_password(validated_data['password'])

        user.save()

        return user

class UserDetailSerializer(serializers.ModelSerializer):

    username = serializers.CharField()
    first_name = serializers.CharField( )
    last_name = serializers.CharField( )
    niveau = serializers.CharField(  )
    genre = serializers.CharField( )
    date_de_naissance = serializers.DateField(  )
    email = serializers.CharField()
    password = serializers.CharField( )
    telephone = serializers.CharField()
    dernier_diplome = serializers.CharField( )
    serie = serializers.CharField()
    photo_de_profil = serializers.ImageField()
    centres_interet = serializers.CharField()



    class Meta:
        model = Utilisateur
        fields = ['username','first_name','last_name','niveau','genre','date_de_naissance','email','password','telephone','dernier_diplome', 'serie','photo_de_profil','centres_interet']