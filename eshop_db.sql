PGDMP      %                	    z           eshop    14.2    14.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    26222    eshop    DATABASE     a   CREATE DATABASE eshop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Czech_Czechia.1250';
    DROP DATABASE eshop;
                postgres    false            �            1259    26249 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    26248    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    216            	           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    215            �            1259    26258    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    26257    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    218            
           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    217            �            1259    26242    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    26241    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    214                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    213            �            1259    26265 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    26274    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    26273    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    222                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    221            �            1259    26264    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    220                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    219            �            1259    26281    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    26280 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    224                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    223            �            1259    26340    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    26339    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    226                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    225            �            1259    26233    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    26232    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    212                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            �            1259    26224    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    26223    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    210                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209            �            1259    26369    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    26598    shop_country    TABLE     �   CREATE TABLE public.shop_country (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL
);
     DROP TABLE public.shop_country;
       public         heap    postgres    false            �            1259    26597    shop_country_id_seq    SEQUENCE     |   CREATE SEQUENCE public.shop_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.shop_country_id_seq;
       public          postgres    false    254                       0    0    shop_country_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.shop_country_id_seq OWNED BY public.shop_country.id;
          public          postgres    false    253            �            1259    26439    shop_currency    TABLE     �   CREATE TABLE public.shop_currency (
    id bigint NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    symbol character varying(255),
    used boolean NOT NULL
);
 !   DROP TABLE public.shop_currency;
       public         heap    postgres    false            �            1259    26438    shop_currency_id_seq    SEQUENCE     }   CREATE SEQUENCE public.shop_currency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.shop_currency_id_seq;
       public          postgres    false    237                       0    0    shop_currency_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.shop_currency_id_seq OWNED BY public.shop_currency.id;
          public          postgres    false    236            �            1259    26566 
   shop_order    TABLE     g  CREATE TABLE public.shop_order (
    id bigint NOT NULL,
    order_id uuid NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    country character varying(255),
    city character varying(255),
    street character varying(255),
    house_no character varying(255),
    zipcode character varying(255),
    "timestamp" timestamp with time zone NOT NULL,
    payment character varying(255),
    shipping character varying(255),
    payment_price integer,
    shipping_price integer,
    total_price numeric(9,2),
    status_id bigint
);
    DROP TABLE public.shop_order;
       public         heap    postgres    false            �            1259    26565    shop_order_id_seq    SEQUENCE     z   CREATE SEQUENCE public.shop_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.shop_order_id_seq;
       public          postgres    false    250                       0    0    shop_order_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.shop_order_id_seq OWNED BY public.shop_order.id;
          public          postgres    false    249            �            1259    26575    shop_orderitem    TABLE       CREATE TABLE public.shop_orderitem (
    id bigint NOT NULL,
    product_name character varying(255) NOT NULL,
    price numeric(9,2) NOT NULL,
    amount integer NOT NULL,
    currency character varying(255) NOT NULL,
    order_id_id bigint NOT NULL,
    total_price numeric(9,2)
);
 "   DROP TABLE public.shop_orderitem;
       public         heap    postgres    false            �            1259    26574    shop_orderitem_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.shop_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.shop_orderitem_id_seq;
       public          postgres    false    252                       0    0    shop_orderitem_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.shop_orderitem_id_seq OWNED BY public.shop_orderitem.id;
          public          postgres    false    251            �            1259    26448    shop_orderstatus    TABLE     k   CREATE TABLE public.shop_orderstatus (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
 $   DROP TABLE public.shop_orderstatus;
       public         heap    postgres    false            �            1259    26447    shop_orderstatus_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_orderstatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.shop_orderstatus_id_seq;
       public          postgres    false    239                       0    0    shop_orderstatus_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.shop_orderstatus_id_seq OWNED BY public.shop_orderstatus.id;
          public          postgres    false    238            �            1259    26507    shop_paymentmethod    TABLE     �   CREATE TABLE public.shop_paymentmethod (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL
);
 &   DROP TABLE public.shop_paymentmethod;
       public         heap    postgres    false            �            1259    26506    shop_paymentmethod_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_paymentmethod_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.shop_paymentmethod_id_seq;
       public          postgres    false    245                       0    0    shop_paymentmethod_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.shop_paymentmethod_id_seq OWNED BY public.shop_paymentmethod.id;
          public          postgres    false    244            �            1259    26471    shop_product    TABLE     c  CREATE TABLE public.shop_product (
    id bigint NOT NULL,
    product_name character varying(255) NOT NULL,
    product_info text NOT NULL,
    available_amount integer NOT NULL,
    product_image character varying(100) NOT NULL,
    product_category_id bigint NOT NULL,
    currency_id bigint,
    price numeric(9,2),
    is_visible boolean NOT NULL
);
     DROP TABLE public.shop_product;
       public         heap    postgres    false            �            1259    26470    shop_productcatalog_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_productcatalog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.shop_productcatalog_id_seq;
       public          postgres    false    243                       0    0    shop_productcatalog_id_seq    SEQUENCE OWNED BY     R   ALTER SEQUENCE public.shop_productcatalog_id_seq OWNED BY public.shop_product.id;
          public          postgres    false    242            �            1259    26455    shop_productcategory    TABLE     o   CREATE TABLE public.shop_productcategory (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);
 (   DROP TABLE public.shop_productcategory;
       public         heap    postgres    false            �            1259    26454    shop_productcategory_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shop_productcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.shop_productcategory_id_seq;
       public          postgres    false    241                       0    0    shop_productcategory_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.shop_productcategory_id_seq OWNED BY public.shop_productcategory.id;
          public          postgres    false    240            �            1259    26514    shop_shipping    TABLE     �   CREATE TABLE public.shop_shipping (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    duration integer NOT NULL,
    company character varying(255)
);
 !   DROP TABLE public.shop_shipping;
       public         heap    postgres    false            �            1259    26513    shop_shipping_id_seq    SEQUENCE     }   CREATE SEQUENCE public.shop_shipping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.shop_shipping_id_seq;
       public          postgres    false    247                       0    0    shop_shipping_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.shop_shipping_id_seq OWNED BY public.shop_shipping.id;
          public          postgres    false    246            �            1259    26523    shop_shopcart    TABLE       CREATE TABLE public.shop_shopcart (
    owner character varying(254),
    amount integer NOT NULL,
    currency character varying(255) NOT NULL,
    product_id_id bigint NOT NULL,
    cart_id uuid NOT NULL,
    total_price numeric(9,2),
    user_id uuid
);
 !   DROP TABLE public.shop_shopcart;
       public         heap    postgres    false            �            1259    26423    userprofile_consent    TABLE     �   CREATE TABLE public.userprofile_consent (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    consent_date character varying(255) NOT NULL
);
 '   DROP TABLE public.userprofile_consent;
       public         heap    postgres    false            �            1259    26422    userprofile_consent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userprofile_consent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.userprofile_consent_id_seq;
       public          postgres    false    235                       0    0    userprofile_consent_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.userprofile_consent_id_seq OWNED BY public.userprofile_consent.id;
          public          postgres    false    234            �            1259    26379    userprofile_gender    TABLE     d   CREATE TABLE public.userprofile_gender (
    id bigint NOT NULL,
    name character varying(255)
);
 &   DROP TABLE public.userprofile_gender;
       public         heap    postgres    false            �            1259    26378    userprofile_gender_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userprofile_gender_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.userprofile_gender_id_seq;
       public          postgres    false    229                       0    0    userprofile_gender_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.userprofile_gender_id_seq OWNED BY public.userprofile_gender.id;
          public          postgres    false    228            �            1259    26395    userprofile_useraddress    TABLE     e  CREATE TABLE public.userprofile_useraddress (
    id bigint NOT NULL,
    country_id bigint,
    city character varying(255) NOT NULL,
    street character varying(255),
    house_no character varying(255) NOT NULL,
    zipcode character varying(255) NOT NULL,
    owner_id integer NOT NULL,
    is_primary boolean NOT NULL,
    address_id uuid NOT NULL
);
 +   DROP TABLE public.userprofile_useraddress;
       public         heap    postgres    false            �            1259    26394    userprofile_useraddress_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userprofile_useraddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.userprofile_useraddress_id_seq;
       public          postgres    false    233                       0    0    userprofile_useraddress_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.userprofile_useraddress_id_seq OWNED BY public.userprofile_useraddress.id;
          public          postgres    false    232            �            1259    26386    userprofile_userpreference    TABLE       CREATE TABLE public.userprofile_userpreference (
    id bigint NOT NULL,
    first_login boolean NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    gender_id bigint,
    owner_id integer NOT NULL,
    date_of_birth date
);
 .   DROP TABLE public.userprofile_userpreference;
       public         heap    postgres    false            �            1259    26385 !   userprofile_userpreference_id_seq    SEQUENCE     �   CREATE SEQUENCE public.userprofile_userpreference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.userprofile_userpreference_id_seq;
       public          postgres    false    231                       0    0 !   userprofile_userpreference_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.userprofile_userpreference_id_seq OWNED BY public.userprofile_userpreference.id;
          public          postgres    false    230            �           2604    26252    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    26261    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    26245    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    26268    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    26277    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    26284    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    26343    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    26236    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    26227    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    26601    shop_country id    DEFAULT     r   ALTER TABLE ONLY public.shop_country ALTER COLUMN id SET DEFAULT nextval('public.shop_country_id_seq'::regclass);
 >   ALTER TABLE public.shop_country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    253    254    254            �           2604    26442    shop_currency id    DEFAULT     t   ALTER TABLE ONLY public.shop_currency ALTER COLUMN id SET DEFAULT nextval('public.shop_currency_id_seq'::regclass);
 ?   ALTER TABLE public.shop_currency ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    26569    shop_order id    DEFAULT     n   ALTER TABLE ONLY public.shop_order ALTER COLUMN id SET DEFAULT nextval('public.shop_order_id_seq'::regclass);
 <   ALTER TABLE public.shop_order ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    26578    shop_orderitem id    DEFAULT     v   ALTER TABLE ONLY public.shop_orderitem ALTER COLUMN id SET DEFAULT nextval('public.shop_orderitem_id_seq'::regclass);
 @   ALTER TABLE public.shop_orderitem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            �           2604    26451    shop_orderstatus id    DEFAULT     z   ALTER TABLE ONLY public.shop_orderstatus ALTER COLUMN id SET DEFAULT nextval('public.shop_orderstatus_id_seq'::regclass);
 B   ALTER TABLE public.shop_orderstatus ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    26510    shop_paymentmethod id    DEFAULT     ~   ALTER TABLE ONLY public.shop_paymentmethod ALTER COLUMN id SET DEFAULT nextval('public.shop_paymentmethod_id_seq'::regclass);
 D   ALTER TABLE public.shop_paymentmethod ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    26474    shop_product id    DEFAULT     y   ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_productcatalog_id_seq'::regclass);
 >   ALTER TABLE public.shop_product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    26458    shop_productcategory id    DEFAULT     �   ALTER TABLE ONLY public.shop_productcategory ALTER COLUMN id SET DEFAULT nextval('public.shop_productcategory_id_seq'::regclass);
 F   ALTER TABLE public.shop_productcategory ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    26517    shop_shipping id    DEFAULT     t   ALTER TABLE ONLY public.shop_shipping ALTER COLUMN id SET DEFAULT nextval('public.shop_shipping_id_seq'::regclass);
 ?   ALTER TABLE public.shop_shipping ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            �           2604    26426    userprofile_consent id    DEFAULT     �   ALTER TABLE ONLY public.userprofile_consent ALTER COLUMN id SET DEFAULT nextval('public.userprofile_consent_id_seq'::regclass);
 E   ALTER TABLE public.userprofile_consent ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235            �           2604    26382    userprofile_gender id    DEFAULT     ~   ALTER TABLE ONLY public.userprofile_gender ALTER COLUMN id SET DEFAULT nextval('public.userprofile_gender_id_seq'::regclass);
 D   ALTER TABLE public.userprofile_gender ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    26398    userprofile_useraddress id    DEFAULT     �   ALTER TABLE ONLY public.userprofile_useraddress ALTER COLUMN id SET DEFAULT nextval('public.userprofile_useraddress_id_seq'::regclass);
 I   ALTER TABLE public.userprofile_useraddress ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    26389    userprofile_userpreference id    DEFAULT     �   ALTER TABLE ONLY public.userprofile_userpreference ALTER COLUMN id SET DEFAULT nextval('public.userprofile_userpreference_id_seq'::regclass);
 L   ALTER TABLE public.userprofile_userpreference ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �          0    26249 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    216   �      �          0    26258    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    218   �      �          0    26242    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    214         �          0    26265 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    220   �      �          0    26274    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    222   �      �          0    26281    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    224   �      �          0    26340    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    226   
      �          0    26233    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    212   j%      �          0    26224    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   T&      �          0    26369    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    227   a+                0    26598    shop_country 
   TABLE DATA           6   COPY public.shop_country (id, name, code) FROM stdin;
    public          postgres    false    254   :      �          0    26439    shop_currency 
   TABLE DATA           E   COPY public.shop_currency (id, code, name, symbol, used) FROM stdin;
    public          postgres    false    237   �:      �          0    26566 
   shop_order 
   TABLE DATA           �   COPY public.shop_order (id, order_id, email, first_name, last_name, country, city, street, house_no, zipcode, "timestamp", payment, shipping, payment_price, shipping_price, total_price, status_id) FROM stdin;
    public          postgres    false    250   ];                 0    26575    shop_orderitem 
   TABLE DATA           m   COPY public.shop_orderitem (id, product_name, price, amount, currency, order_id_id, total_price) FROM stdin;
    public          postgres    false    252   1?      �          0    26448    shop_orderstatus 
   TABLE DATA           4   COPY public.shop_orderstatus (id, name) FROM stdin;
    public          postgres    false    239   �@      �          0    26507    shop_paymentmethod 
   TABLE DATA           =   COPY public.shop_paymentmethod (id, name, price) FROM stdin;
    public          postgres    false    245   A      �          0    26471    shop_product 
   TABLE DATA           �   COPY public.shop_product (id, product_name, product_info, available_amount, product_image, product_category_id, currency_id, price, is_visible) FROM stdin;
    public          postgres    false    243   LA      �          0    26455    shop_productcategory 
   TABLE DATA           8   COPY public.shop_productcategory (id, name) FROM stdin;
    public          postgres    false    241   KE      �          0    26514    shop_shipping 
   TABLE DATA           K   COPY public.shop_shipping (id, name, price, duration, company) FROM stdin;
    public          postgres    false    247   �E      �          0    26523    shop_shopcart 
   TABLE DATA           n   COPY public.shop_shopcart (owner, amount, currency, product_id_id, cart_id, total_price, user_id) FROM stdin;
    public          postgres    false    248   F      �          0    26423    userprofile_consent 
   TABLE DATA           L   COPY public.userprofile_consent (id, name, email, consent_date) FROM stdin;
    public          postgres    false    235   �G      �          0    26379    userprofile_gender 
   TABLE DATA           6   COPY public.userprofile_gender (id, name) FROM stdin;
    public          postgres    false    229   EH      �          0    26395    userprofile_useraddress 
   TABLE DATA           �   COPY public.userprofile_useraddress (id, country_id, city, street, house_no, zipcode, owner_id, is_primary, address_id) FROM stdin;
    public          postgres    false    233   oH      �          0    26386    userprofile_userpreference 
   TABLE DATA           �   COPY public.userprofile_userpreference (id, first_login, first_name, last_name, gender_id, owner_id, date_of_birth) FROM stdin;
    public          postgres    false    231   %J                 0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    215                        0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    217            !           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);
          public          postgres    false    213            "           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    221            #           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 26, true);
          public          postgres    false    219            $           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            %           0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 119, true);
          public          postgres    false    225            &           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);
          public          postgres    false    211            '           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 50, true);
          public          postgres    false    209            (           0    0    shop_country_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.shop_country_id_seq', 9, true);
          public          postgres    false    253            )           0    0    shop_currency_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.shop_currency_id_seq', 3, true);
          public          postgres    false    236            *           0    0    shop_order_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.shop_order_id_seq', 18, true);
          public          postgres    false    249            +           0    0    shop_orderitem_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.shop_orderitem_id_seq', 37, true);
          public          postgres    false    251            ,           0    0    shop_orderstatus_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.shop_orderstatus_id_seq', 3, true);
          public          postgres    false    238            -           0    0    shop_paymentmethod_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.shop_paymentmethod_id_seq', 5, true);
          public          postgres    false    244            .           0    0    shop_productcatalog_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.shop_productcatalog_id_seq', 20, true);
          public          postgres    false    242            /           0    0    shop_productcategory_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.shop_productcategory_id_seq', 7, true);
          public          postgres    false    240            0           0    0    shop_shipping_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.shop_shipping_id_seq', 6, true);
          public          postgres    false    246            1           0    0    userprofile_consent_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.userprofile_consent_id_seq', 6, true);
          public          postgres    false    234            2           0    0    userprofile_gender_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.userprofile_gender_id_seq', 2, true);
          public          postgres    false    228            3           0    0    userprofile_useraddress_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.userprofile_useraddress_id_seq', 12, true);
          public          postgres    false    232            4           0    0 !   userprofile_userpreference_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.userprofile_userpreference_id_seq', 8, true);
          public          postgres    false    230            �           2606    26367    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            �           2606    26297 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218            �           2606    26263 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            �           2606    26254    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            �           2606    26288 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            �           2606    26247 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214                       2606    26279 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    222                       2606    26312 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    222    222            �           2606    26270    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    220                       2606    26286 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    224            
           2606    26326 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    224    224            �           2606    26362     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    220                       2606    26348 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    226            �           2606    26240 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            �           2606    26238 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            �           2606    26231 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210                       2606    26375 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    227            7           2606    26605    shop_country shop_country_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.shop_country
    ADD CONSTRAINT shop_country_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.shop_country DROP CONSTRAINT shop_country_pkey;
       public            postgres    false    254                        2606    26446     shop_currency shop_currency_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.shop_currency
    ADD CONSTRAINT shop_currency_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.shop_currency DROP CONSTRAINT shop_currency_pkey;
       public            postgres    false    237            1           2606    26573    shop_order shop_order_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.shop_order DROP CONSTRAINT shop_order_pkey;
       public            postgres    false    250            5           2606    26582 "   shop_orderitem shop_orderitem_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.shop_orderitem
    ADD CONSTRAINT shop_orderitem_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.shop_orderitem DROP CONSTRAINT shop_orderitem_pkey;
       public            postgres    false    252            "           2606    26453 &   shop_orderstatus shop_orderstatus_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.shop_orderstatus
    ADD CONSTRAINT shop_orderstatus_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.shop_orderstatus DROP CONSTRAINT shop_orderstatus_pkey;
       public            postgres    false    239            *           2606    26512 *   shop_paymentmethod shop_paymentmethod_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.shop_paymentmethod
    ADD CONSTRAINT shop_paymentmethod_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.shop_paymentmethod DROP CONSTRAINT shop_paymentmethod_pkey;
       public            postgres    false    245            '           2606    26478 %   shop_product shop_productcatalog_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_productcatalog_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY public.shop_product DROP CONSTRAINT shop_productcatalog_pkey;
       public            postgres    false    243            $           2606    26460 .   shop_productcategory shop_productcategory_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.shop_productcategory
    ADD CONSTRAINT shop_productcategory_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.shop_productcategory DROP CONSTRAINT shop_productcategory_pkey;
       public            postgres    false    241            ,           2606    26521     shop_shipping shop_shipping_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.shop_shipping
    ADD CONSTRAINT shop_shipping_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.shop_shipping DROP CONSTRAINT shop_shipping_pkey;
       public            postgres    false    247            .           2606    26561     shop_shopcart shop_shopcart_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.shop_shopcart
    ADD CONSTRAINT shop_shopcart_pkey PRIMARY KEY (cart_id);
 J   ALTER TABLE ONLY public.shop_shopcart DROP CONSTRAINT shop_shopcart_pkey;
       public            postgres    false    248                       2606    26430 ,   userprofile_consent userprofile_consent_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.userprofile_consent
    ADD CONSTRAINT userprofile_consent_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.userprofile_consent DROP CONSTRAINT userprofile_consent_pkey;
       public            postgres    false    235                       2606    26384 *   userprofile_gender userprofile_gender_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.userprofile_gender
    ADD CONSTRAINT userprofile_gender_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.userprofile_gender DROP CONSTRAINT userprofile_gender_pkey;
       public            postgres    false    229                       2606    26402 4   userprofile_useraddress userprofile_useraddress_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.userprofile_useraddress
    ADD CONSTRAINT userprofile_useraddress_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.userprofile_useraddress DROP CONSTRAINT userprofile_useraddress_pkey;
       public            postgres    false    233                       2606    26393 :   userprofile_userpreference userprofile_userpreference_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.userprofile_userpreference
    ADD CONSTRAINT userprofile_userpreference_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.userprofile_userpreference DROP CONSTRAINT userprofile_userpreference_pkey;
       public            postgres    false    231            �           1259    26368    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            �           1259    26308 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            �           1259    26309 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            �           1259    26294 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214            �           1259    26324 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    222                       1259    26323 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    222                       1259    26338 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    224                       1259    26337 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    224            �           1259    26363     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    220                       1259    26359 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    226                       1259    26360 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    226                       1259    26377 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    227                       1259    26376 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    227            2           1259    26588    shop_order_status_id_60793dbe    INDEX     Y   CREATE INDEX shop_order_status_id_60793dbe ON public.shop_order USING btree (status_id);
 1   DROP INDEX public.shop_order_status_id_60793dbe;
       public            postgres    false    250            3           1259    26594 #   shop_orderitem_order_id_id_2d236625    INDEX     e   CREATE INDEX shop_orderitem_order_id_id_2d236625 ON public.shop_orderitem USING btree (order_id_id);
 7   DROP INDEX public.shop_orderitem_order_id_id_2d236625;
       public            postgres    false    252            %           1259    26496 !   shop_product_currency_id_32052b86    INDEX     a   CREATE INDEX shop_product_currency_id_32052b86 ON public.shop_product USING btree (currency_id);
 5   DROP INDEX public.shop_product_currency_id_32052b86;
       public            postgres    false    243            (           1259    26490 0   shop_productcatalog_product_category_id_429b8830    INDEX     x   CREATE INDEX shop_productcatalog_product_category_id_429b8830 ON public.shop_product USING btree (product_category_id);
 D   DROP INDEX public.shop_productcatalog_product_category_id_429b8830;
       public            postgres    false    243            /           1259    26551 $   shop_shopcart_product_id_id_ce69704b    INDEX     g   CREATE INDEX shop_shopcart_product_id_id_ce69704b ON public.shop_shopcart USING btree (product_id_id);
 8   DROP INDEX public.shop_shopcart_product_id_id_ce69704b;
       public            postgres    false    248                       1259    26618 +   userprofile_useraddress_country_id_16aa4cb5    INDEX     u   CREATE INDEX userprofile_useraddress_country_id_16aa4cb5 ON public.userprofile_useraddress USING btree (country_id);
 ?   DROP INDEX public.userprofile_useraddress_country_id_16aa4cb5;
       public            postgres    false    233                       1259    26420 )   userprofile_useraddress_owner_id_0a09037b    INDEX     q   CREATE INDEX userprofile_useraddress_owner_id_0a09037b ON public.userprofile_useraddress USING btree (owner_id);
 =   DROP INDEX public.userprofile_useraddress_owner_id_0a09037b;
       public            postgres    false    233                       1259    26413 -   userprofile_userpreference_gender_id_b03dfcd5    INDEX     y   CREATE INDEX userprofile_userpreference_gender_id_b03dfcd5 ON public.userprofile_userpreference USING btree (gender_id);
 A   DROP INDEX public.userprofile_userpreference_gender_id_b03dfcd5;
       public            postgres    false    231                       1259    26414 ,   userprofile_userpreference_owner_id_451add7e    INDEX     w   CREATE INDEX userprofile_userpreference_owner_id_451add7e ON public.userprofile_userpreference USING btree (owner_id);
 @   DROP INDEX public.userprofile_userpreference_owner_id_451add7e;
       public            postgres    false    231            :           2606    26303 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3310    214    218            9           2606    26298 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    216    218    3315            8           2606    26289 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    214    212    3305            <           2606    26318 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    3315    216    222            ;           2606    26313 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    3323    220    222            >           2606    26332 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    224    214    3310            =           2606    26327 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    220    224    3323            ?           2606    26349 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3305    226    212            @           2606    26354 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    226    220    3323            H           2606    26583 ?   shop_order shop_order_status_id_60793dbe_fk_shop_orderstatus_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_status_id_60793dbe_fk_shop_orderstatus_id FOREIGN KEY (status_id) REFERENCES public.shop_orderstatus(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.shop_order DROP CONSTRAINT shop_order_status_id_60793dbe_fk_shop_orderstatus_id;
       public          postgres    false    3362    250    239            I           2606    26589 C   shop_orderitem shop_orderitem_order_id_id_2d236625_fk_shop_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_orderitem
    ADD CONSTRAINT shop_orderitem_order_id_id_2d236625_fk_shop_order_id FOREIGN KEY (order_id_id) REFERENCES public.shop_order(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.shop_orderitem DROP CONSTRAINT shop_orderitem_order_id_id_2d236625_fk_shop_order_id;
       public          postgres    false    3377    250    252            E           2606    26491 B   shop_product shop_product_currency_id_32052b86_fk_shop_currency_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_currency_id_32052b86_fk_shop_currency_id FOREIGN KEY (currency_id) REFERENCES public.shop_currency(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.shop_product DROP CONSTRAINT shop_product_currency_id_32052b86_fk_shop_currency_id;
       public          postgres    false    243    237    3360            F           2606    26625 C   shop_product shop_product_product_category_id_52ded8bb_fk_shop_prod    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_product_category_id_52ded8bb_fk_shop_prod FOREIGN KEY (product_category_id) REFERENCES public.shop_productcategory(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.shop_product DROP CONSTRAINT shop_product_product_category_id_52ded8bb_fk_shop_prod;
       public          postgres    false    243    241    3364            G           2606    26546 E   shop_shopcart shop_shopcart_product_id_id_ce69704b_fk_shop_product_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.shop_shopcart
    ADD CONSTRAINT shop_shopcart_product_id_id_ce69704b_fk_shop_product_id FOREIGN KEY (product_id_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.shop_shopcart DROP CONSTRAINT shop_shopcart_product_id_id_ce69704b_fk_shop_product_id;
       public          postgres    false    248    3367    243            D           2606    26619 V   userprofile_useraddress userprofile_useraddress_country_id_16aa4cb5_fk_shop_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.userprofile_useraddress
    ADD CONSTRAINT userprofile_useraddress_country_id_16aa4cb5_fk_shop_country_id FOREIGN KEY (country_id) REFERENCES public.shop_country(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.userprofile_useraddress DROP CONSTRAINT userprofile_useraddress_country_id_16aa4cb5_fk_shop_country_id;
       public          postgres    false    233    3383    254            C           2606    26415 Q   userprofile_useraddress userprofile_useraddress_owner_id_0a09037b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.userprofile_useraddress
    ADD CONSTRAINT userprofile_useraddress_owner_id_0a09037b_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.userprofile_useraddress DROP CONSTRAINT userprofile_useraddress_owner_id_0a09037b_fk_auth_user_id;
       public          postgres    false    233    220    3323            A           2606    26403 O   userprofile_userpreference userprofile_userpref_gender_id_b03dfcd5_fk_userprofi    FK CONSTRAINT     �   ALTER TABLE ONLY public.userprofile_userpreference
    ADD CONSTRAINT userprofile_userpref_gender_id_b03dfcd5_fk_userprofi FOREIGN KEY (gender_id) REFERENCES public.userprofile_gender(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.userprofile_userpreference DROP CONSTRAINT userprofile_userpref_gender_id_b03dfcd5_fk_userprofi;
       public          postgres    false    229    3348    231            B           2606    26408 W   userprofile_userpreference userprofile_userpreference_owner_id_451add7e_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.userprofile_userpreference
    ADD CONSTRAINT userprofile_userpreference_owner_id_451add7e_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.userprofile_userpreference DROP CONSTRAINT userprofile_userpreference_owner_id_451add7e_fk_auth_user_id;
       public          postgres    false    3323    231    220            �      x^����� � �      �      x^����� � �      �   r  x^m�]��0��ݧ�	VK~ ��i��7A�dWs����v�7_��=��վ��v���Z�oW�0��iHǄt��u�@q������_�R�	�����b�@u6����s?��1Y+��9 ŝa�X1h�k�d�h�uy����N�`�M�Ok.?_�T�SFĎ ��i�2�\�c^�����O�ğT�:���Sy=�Ʋc����M�������3��^K8,��{��H)V���#+Xϫ*�V�����:�\��.�������P�ɰ���0�S18�{���^��J�r��FkSp��I��N�
6�<��o�Yys�W�n����'t��?�W��U��"� [��oU����LªLd���U����-�胃�t�$)��,�I�f�L��8 ��C�\��H��N�4e�$��u�2W��3�'S99̔�t�)ns�&���c:Cp,����ΐKfkJ��X��)U4La���.��U|]���Z�b���@����h�'� ���p{wKR���~�Η�<�:] J��|���4R�Ӯ4߅�	ծ��ƍ�$+��viCw���d�'U�@�v487�A�vd8/��<��TRj�>�։/?�E*�"���LJ���=�fZ,�M��d�����\4�=�2n �O5$�ph�j�oCYwT�N��~�>���ps�=I��U.R�-�F���{Í(�F�m7�
J��G?��+����<��m�܀��Ȳ%s�����Q�$u~�k����<�H'p�/��H@�`FM
�+�KQW�-��@���tj O���8]Mt�(_n������_�ӅT��]!*HZOC^��6�A��d�$�����\�<�+��@�K�0��HJz	f>����=      �   %  x^}�[��@���Wx��Y�3�d��+���JU�lҀ�r<���۴�ڝ����{�y_D�̍<������T��&H����l,Zz+�>�O֋�v��\�M>��F^�^���`��~�2؉K���r>7^�E�/w��ЉJW�#'�FQ�o��	ba�I��� BO@yB�����J�@%�P�Ǥ�X�*ۚ������O|i��;��vf[P?5�Y!<�K/%�M�dt�]��,�ެ�?'CP��dT$	
�D��8��P�}� ���b�(�:��~��Nӭ�������,��L{s��}<��n�x-����'#H]Ѱ��d���_��*��D��aBٽ�:,��GȐ^��c~#�R��2�^0=�C^G��;�6C�C�� ��a-`�]�/�/oð�-|m*67�rU0��.�B�^8�?��t�_n�(����.��g>V�'2�{|@o� k��-���1<5��1�裉����~���Cp���:H�y~���5���CE�T��+�K���?�U��DV��}�Z�'��      �      x^����� � �      �      x^����� � �      �   P
  x^�Z�n�}}�@A�d]}o�9�g�1�X�C6~���)���Y���e�=ɵ�! ���U��}�T�iQ��sQ�i�̈D��ÿ��񂊿5����u3����Q��/�|.\AW��1g���y���xn.xMB0�b�O�v}�ng��]N�r5�w;ٖ��?ِņ�G;���H.��v�_�n7�#^��/�G���2N.~�}�����($,�g#�5�,D��V���4"U[�W��`�=\�GR֎	�ȯV�6��V	[K�������o����D��_�މN,����f�3|�g��HU���;�Mi�Uw.�"_o�b6����6ٕl�b����HD�m�>n#��V��7�ny`f������`��2��՛�yv�XN#�5cF�p��"*����C��1���l�.�����7���K{��秇%ehNp	4���7�
�<�L�TY�q��5N3`����g��J�x����g��7��M��C��<Gy���&i�)�y���z�t`7��Fxw�<���p�b�tm4�\F�9�]<�W4�#�kг����ˇ�\�3���^���+D�)P�j<_��hw�3R�6��t���z5�M�w���]�7���\��t�+H��L;��w���a�lˏo�߀���B�"Zt�FJ��(�c
����h��)�
9��F!��-������r��]-���VȻ��ֹS�v�X
�ϋ���������n��O��W�ݲ9�/�b�����Q�ݭW'�3dFk5beNZJ��`N���n�����?���#�c� �E�6�96ʻ+�˟��G���C��j���!�y�m�'�*�'�R��Y=>���zS��|�<mWO��_��A�J��%z����O~�!�a���;����v���*��˟��)O2C��G#���<�s��E�����{��������bq�G��Rց{m������y�vIf`��v��uq)m�������̝5GjT�p���å���fq�G��Áuj嘋ţ�i6Ǭ��A��ZHp�&�v�>z��:C&�Q�jwM }�N�h8W����l�%���G�����񜡹��j�3��� �_�_1�G�Lq�M������,	L�PQ��$�(�ȷ��ǯ�S,g��Qey�X� e�
��?��j��4�yͥ�,[�7����]��+Nn#K	x�0 ؚԇtd���s�����x�H��%Me9��y'W�7Rz��,�z��f'�/�/��8�J�M#�1vJ���/>���l�ن~�S�r!����lS���/��-���n�ͲZ�s��#��dEl�^�oNG��,L�0Ӣ�K�Y;V�W~�ާ_�ՙ3t��ڄ����f�!�]�e"��px�<=)�9�}�@�D�d���KDq�nfG9��c����қ�A��������tl&�	^5�DV�ҵ��=={�g�m���z�j`�PR�}���\�ܧ!Z24\20�?(S4S3��Uh���3�+�NEEn2U��tF�}�f��j���(�!	��A�aR�9�"A3n�A�A]&��P.�d4�b�Z��Q�HЌ=���@��E�^$f�&aؖ��.�
���V���L�&�������*N���H�t���A��݌�m�ܙ2b2��%��%�������� ��z1U3�)d['����[��jV����C$J����>T	]W�>Ta^����<P+��pO-�k���x���N'���9��>#�Wb>BAxIP�>��3D�������%��f�br����E؋͈!Uҏ�B̎
+�Lp��i%�ZVR�Y�3�f05S6Asҝ�Ͳ�Ka���ܥ��Ew��Ͳw`���xG+�Lo�e��B�8�@����Wg��Ր=і��9T���r L�fA����f�&k��b�|
�r�C��h�Nx��#����+;H�h,P�A͔�x�
�x �h�IV�)F�?w��X��]�F&i��oO�XS� T#K��ݧ���Ec��\	�����Og �arw)DVdSO��/�e�
�������KXl�w��>��,^�������B��Ϗ͏���2 F�A7B�8&���3P���q�ІE"���Y*n>R0 �H�g,��D���ד�>�N\���*v�x
�/Mqy���r��D�xJZ}0 ��d`/
��^��e��)��Rݳǻ�z�f&4��x�Y��QcpH���,�d�X��}6�&2����wn%�82Kr']��o+�Z1�&�g�e�Vn��m��5 G�ib@�V��0j�~�w��D�Г5D �\�>���t³e?�Y�ڀ=���">V��lƫ��;��o3 vO��*F%	�J�f��4A��c9u���V�T*��Ш�S���/i^�{��aC���nh����T���s>?4��jBU �n8x$ظ6|W�a��Qz�HU�e]�I�̌��lLc2l2����>$�V��'~�AS�����t5�p�&3q�%¦,߇�&/�^�Q�Q��K�V,��en6QA�S���#T���^&l�}X��}��M$�Â0�C0^�c�7��<Ηg�����>/}A�W}uu�?M_��      �   �   x^e�K�� D��0�&���l������~<�H�zg����q!�lV�1W�`2����E"e�23���4A�����VP�<�`w�^���
�'��k�)x})���#�O����^NTc�� k�,T�o�o��N�K��M�^�$��Z8z\���~��8�����8X�\ඤ[օ�砲�Rb���v@�;���C�.�.VL0�������?[m�	      �   �  x^�W�n�8|N�"�"u��oY@p5�^����R�-;M���i��9����/�t���c���0��C����+�=+���BU31|�]s�>~���K]��k�m��"D	�Mk�sw�D��|�}zG�w�9�&�k&QE�b���\s�Bwq����]8ϊ浖,a��p�f��E"ݥi�s(���U��5����C�1��]��qg9�ϲL*�J(>C]G��m�?���"qm
�آD��N�O���$�X��[�s3N��@�]�ϕ%P3�H((�����2u$S|�	g�%za�g=��ٜñ��a��q~���~��7���L1�xg�����,a�\izF2���R�l ig(`3�i����P�U`�]{�Ȼ~���6���� x�(r�E�I��a�����Zi���n�����6���]|�2g�����2a�U\�Z%�}�DGVs���9G++M%�B���5�G���U.&DZ�Fb5��p[������-���\�4E�_��\`�c������
])���6Ϳ�ɔU?�w?�������ݽ�ak5|��rf%T\KΓI�؍]��2���T��R%i�,!�,��I��a:4SC�����ѵݰ�)!"O��Bj�UA��Έ�b*�Hua���?_i�}�T��֦g��p���7������;��#�}��臮?4Ô�W|w�J4r+�v���$�F�FϪw�VS�+�?�a�n9a2*��L��!6���[��m��3M�RV LB	g%�^+oS6��TdL�Q�K��Mŀf\(�z�:�zn�ZR�$�������±��%��J!�����4��7TtD�̧_��S�5t�;���+��+�(�2
 ��Ex�6���uE�",�����ihx����)�*U��?�8�)���-&6�R��.�|��lcV�$̂�4"YS
-b���z�́�rUV�F���r�>��>e����4.�H�:c��&z430�,	Q��r,�AgM�4ˉ�r��ȓ��P� �`���܋�o��!��$��AӚ�ƃv�v4$�1�
y���zy�E�@�;��Ae� �U����:g�dG��O�6+�g�
�BVh$���Pd��i�}�1���-|�=�WeATBi�,",�oY	��xn���pb14���,�"��Iq������U�.{eӣ/7D9��b�{G�+.'u1���"B�G�H3\�U���
�dq�����a�]������Ѯ�.e�Ny�]�����`�n      �     x^՚׎�H�E�g���*�e&�&�[�;, �{���K�S=���P�,ED�{#p��21G@ca]��8qT6u��eb ��v��$�}��کWLw�ٔ]��С����S�)�qH�@h ��?� �(�������ZSAca�g��2'|�k�	��Y�|uƤb�.�͑}rp�t}7�^�������7���޴R��_%a_� @�뫚�!��e�tm1�E�g�sYHT���/s�\��D����`>Gȑ�վ.�-�m���2~r&�mY�k���%��G��;{�>�+?���e���G��:mt��E�k|'*�wo�ʂۊt?t��^���v�����c{��'twG�%:?bfm�%�~c�AF�����9�����Ǒ�'U�λ���F����>���v>*^����$H� "�/De��a[k5bF�I����)�\��ODd��P��s�{;mF�3��az��l�E#�=�ʩeo��4��� @�Ҿ�$̿L0�/D�بq�:0�L�Z��+�*I�N�_�����ޘ��}*��z��1:ݿ�����Z���Y�.,�~f/4���qs�q2��&Ux��qH��촾���+1��7�n��6���є�������$�rt�|�E�%
�G�r@��<���,"�Qs�ҲmWK���b�����$�� ��Y�V����1G������ ����C���Eȋ��t�k��&�����T7#�[���XDw���X�L7e���y;6���{E˧�����3wpwr��g�$� �T�/D��ڞ�����r�ej'�o�a����=N)���|.�%�
�Y��Q6;���7pt7@�g��UE}��B		�/�D�ޣ���R�0@H���Q�X�ԛ.kY����N�;��WjG�m2	�k�O8'
ūcec�>ͻ��Q����B���oDF��^�4��`]	C����ñ���HUr�!S�}��J��0��x��,{n�����7p����UQ?���	}+!�����w�R���BE1�
����)v�p���+�5v���Sf�mb�wk�t3ȅ���OD���E`�PoD6IbM�>�~�?�]��N]�>��n#i:	rng����vN7��V������j��}rʳ����OD��\xʰ�ufC(q�k6�mF����9T�LB���S%��XC�W�L7�Na�rө/�
�(��6p�Kt��P/�	��I�
G��� ț�8�X��{@�h��39	�KC�[�eve�k�Q�56]-y6_�����i8���i�%$J�}�zu��3;.�y�Ǹ.QIY�ˀ"}?�LD�X�n��&S�ޚh>�$���sLfO%c���ڍG�������������ZxQۆ�Vؚ��~V�Y����}$�zz�jU2С�8���R��yL�m14��c�<ga,��oU�~��{��A�ۏ��Yi
bQ7V��vAVTL3!�c$�YEm���o'�>	���Q?7��4Wg�Lv\���hp<�J^���5�=�/�w��2��/5<�iUU-hL�Ԉl����6gRZ�\�b��̈Y�����c���|��a��V���'�~�/� �o��yy�PKȵ�s����^�T�2�$�
>��n���r_��EH.���a(7�:�c��
��kF?�|�h�mѰ�ȗ(2��>ߏH�ɫ ���'&	��"���Դ�OD�Ť��V4�����ln��Q������I���#��gOo�t1�#�]lo�^_�~�����/}�#�P�ѫ����B۠�i�tbZ�%���Y<�����5��ഐ���-����{I#�? yU�_L��tdM@}�:�~h"+��Z���kQ��Y��>o$ّ�G����2��i�í]?��\�嶼���j�����M��D{鈾8�n��-���$�C7 v�{�"�|wiU��h�Z=IU�upV�P�F`ͼ�r�Czo'�b���9�&G��]E?q	�>��?#G�	Y��B�V�j��HCA���?R�[Y�V��1a�Z�&-o_#r>�yTs�TL#e����7�!��M>�e���!��?����SS�m��*S%����Le��g��v#J������=�����n���J�`=L������i>�Ϳ��G���-� �?���2�}���Z��\!�V�� �`��&������8S3:V�8�U_u�	�3������9���GAG�M���Y�	��nr@�ŷ"/�������bc9���xE�^�xUZX��B�W��T����q�m���M���x��K����>��s����U+�V��A]�C#�v����8����m�d�����`9Y%��$Bo-�UF���ߍ�(�W �2"L\t��-��%O��ʢ��ϜEyeK�$�[[ٛ�g�uw���ҟ�j\�y؊�N�W����.�D����@�e��8�Ė�6$4#�5]@͎%���~�d\��+-3�y�����G6	�16�����<�v�*�ڲ�>(�N�~!�sG��0�=���7���sPf37w�TLڨ��
>2�7&���-rK>͎b��U�Pާ�h��
:�O�-ɪ�����0D�/]DB9|�\Ccj����w��S�pB���&Ib'�>��/�I�'���{wE�}�\Ѿ<.��!���8�N5M��~/@~U�(�%P�E�B��.n�~��:��vK}�"=�DB�t;�����]`yVϪ�a@�Y�K������z$Mor�?�]l_D�Q�/q�����3<�hM71,�#��9w<�?���\�n���>ن\9W2���-m
�{Eߨ���|����g��V�i͈ �w��%i��!�O�*�4�6E��Nl~d\d�s(�7��f�Ѧ��Y��`i^�U�
� ��eE���2x�ȿ��k�|�W�0b�=�8ih*-��̤���Z��;v���G�kC>k�����|(�΃�+��l\�"F��	��yȔ��΁,���nވP���/L1�oD$�(n���V�)#���M���D�?��t�"�Jtޤ�P���>��rJ;�.�[2�u�<97zd�Y|'j/uM��m5��b3�_S =W������k���p�bTw�����=D�t�-d��}n5�5�sm��h��}�x�@fa��@�����������h��j* �y؉��Y�iC׮z���EdG�N�#�0�F+�H�|��E'{Q�ĵ�퀽%�9�~�Q�g������!��=�#�Z"���~a2PV�$��(M�����BCr�Ax>ޓ�<�#���<���|Q���Y40	�^��������ת�u�Fy�߁Z'x��QVab���5�%�AP��B�F��H2g�]�N��]�d��d�+�(T�	�V@�'�8�'-���H���i�˾�(�q�����}.�vNŅ�m'c��І�|%�E*�㱲�����-�f���SdlM/u7�&�N�����3���p��]K�0=�.�]Ca	��@d7�6��aT�!�y4���Zސ�.�WN��cVN��M�dx���=�CW���2��U�Ë����ns�n�cc5Db>s�#AMmǏ9P;�-�~ǲ���~]�}?h F���J�5Lu�����I��'��t� �Y��g!�ӝ�Ă��^?�J������/���M�r�U��jr� a�6r��t���S��p)������#��s��_����>+��k�Tca[��Ģ?��~i�xsȧ��F��1S+���;N醴jp�Y�v��G�.ODro�Y
�s�t����8�=,.Vǽ��f��H�{w�~k��α�US	��~�K����߯����� "��         X   x^3���I�K���2���/K��L���2�tO-�M̫�tq�2��(�KO,����2�t,-.)*s�2�t�JM� r���b���� �N�      �   f   x^3�t���t�JM�PJ-(M��LV��/*�K�TS67�VS62���L�2�t�t--��|Դ(`�����Y���\�X�Z������Xĩ�Y����� (�      �   �  x^���n[G���S�7�����˩؅���80`��k�PR���e��B��9$u�!��)	t
��7�堑�X�ɶ�erds�lGNz���?��}Y�����������Uݼ5�Ϗ�/����k�b�[����/6��2�6��͇l\O� �! ��,���~b|��������A#�_\8#9�A�sF�A�Ma��g�Q�K�������W:�6sַ���e�0��� �4�9��I,��l�eX���3���)ņ��ʳ���lbŤ���,����E��,H,Y��|J�qr�"a��� {+֛��;F��5�AS/d$�5��z
5g9�X�F���.ܒ��
�W���4��R���.��u$�T���LU�O#���&�	a��p���t�I�d������Ic�"�.�v�+'��f��f����|*'�h�`r�jL���#(�ޜU�Mjm�D@sI9��}q�#M\ ��v�RM�r5��a]h���`����s}������"=��7y��韝>6HΠ�]{�,Ld�cJH�u�r֛��)�;Զ�%���y/P-��Zl��G��������)��/��4��� �������k4��P�zDV�r�y�hi,�~�'W}wuo�^���]��X_n�_]n>���+K4��X,�`���yn{;�Z�+���������e֍BE�"�:�����<�y*��������~�2���D�-��l:n�t͓�+@G?�lX��pf{��y}�s�s�?mہ��&I��M��\�Op<���'��bb�5IQ��5���"	U�p�h�ϳ��<L$��*O�wv�������J�:Fut�t/�Gw͖��='d���M�%�D8��a�x��tߗ4EM�ї���}/Y�2��,Xm��k�c.ڡ���-�"�!G�\P��?��]�q�괇J��V���_��          �  x^��OO�@�ϳ�������i{��AÁ���"ƴ%&~{���
#����{o���[h��z�5xn��@6~Vw]�߬w�|ׯo{@��A�y(H��g��Q����l�p"��)�C������Z�:2f�������/W���4�׬V^�Q�Ȫ�ʭƜ�1U=ι�C����X�OM ��xl��*ez-�x�b *D�I��*	���'�~��Wf��)�cu��x�l\��4s����j�x��!Sf����?�؊�����ɹ�pox�BQr�����IQ���cK�DEՍ0�W2��e�u�ދ�]�����LE5���3z̖#���I��W�F���dL*��+�������e͕(�p���e��G�W-OZ�Lw�:QJ�u0�      �   +   x^3�t��-�I-IM�2�tN�KN����9]��J�b���� �
�      �   0   x^3�t�HM��4�2�tN,��4�2�t.JM�,QpN,J�4����� ʅ	~      �   �  x^��n�6�����ز:X>\�6�1-ͶE�-�%f)R���߾?e'd�zađ�����3���c뎎>�~�(Uq�<����FR�8OAG�#�w�9���'���C�mOltt�,wt�Aw�HJ&z�q #�ޑL]D0#�#!^
4�'=�����iK�T�XѨɧ��K(�{�C�#Yg/�EQ���;��;=ʞ÷��v�%���me�jD�Y��RL�/��*��,EY�.~�T@���!�I�bp�fW-���W���r�^����b���e{�~Y��1$hy?J?�Y�b�ɰꙬ<��{����w��<O�}dR2�Cdh�΂�ѝ�I1��{�'Yy8d�(��34�����ab~I�9zB�Ǥ=��Á�·+&������\J�v2,C�ᤥu��!�#��@n�!?�WJ����HR� ++Ϣؼ�x岻r�4�rS�*�.W�e;{i���b���Ɂ��mS�*=����C
{iU }��	�;۳�3�`��\8� �Q+e8f��vn�5@�^]��&��9c�ܟ@���]�v���p6�Y�LZ�9e����c�A\�!���a2�#{ihσ�Ds�� 5��d��Dg��������4���H0�.�M���Pz�6�u�`z��aV:YP�9�#��p@>;�8�'����x)#�}?�� ��|~Ǚ@L�G�ou�9����ƾX<��LҠB�� 'T9��z�|!�V���,�s�ެA���g� �Ȟ��>F���;�l #��NNԚ��Cu��YSg��jz2��5G4��nr�I�7qN� ;��P��~ ]��NaUH:��#~6˔���_7��ڻl�ݶyn�ŦպmW��x���u�Tϳ�~KuY�op���1_ﷻ\��ӮD��˶�2d����i��?ܽ���jG��6�h�e[n���2��Z%�m����wʪzm��X��}�y�)E�Z7��|������G����]p_�      �   T   x^3��HML)���K-�2�t��-(-I-*VPS�I,(�/(�2�	�2��/� �s�s��'e�rr��+$'����Ur��qqq �]      �   T   x^3�H-*���K��4 B�P.C΀ NC#N#�˔3����̜����DNCNCd�b�"�|=.3N� �������� ׮      �   l  x^��=� Fk�.^�_L�:M�n0��G�g��M�,B��~��?�߿~4m�����m��{�=Եa뽑c%�z�k¢@8I�8\X���DS�������� �}Bw����٭y��\?�G �\ K	��;�`��M��=���,�@�'���ncy��响1�9&�S��/v1f=�3��ږ�U�Z�q�d�6�1D>��/��m[�M����Y}�_R�Gk�z6��-�[㗾u��c�HW��n[7��K�5>���]���F�r~��=4�Efw�ظ [6�sW���O��cc$���+Zb��*��'�`��b5�w%��+�
��R"��e��g������x�����      �   �   x^��=�@@�9��d��L,���ͪhî�������Gձ��5��S�N���>,�m��2������ø��c����T����3RTs.�r��4��9�3)�R���F#֖Z�F�0h����M#a���X��9�$ҙ`kĦ��S�"�f�� _��/      �      x^3��M�I�2�tK�1b���� ;�      �   �  x^���n[1�g�)�$��e�RE����uC�>ű�K7�}�,Fޫ<.:YQ�>�?)2�|]�l�����z1���Ț�f`ʥv}��g��b��3���Vz����E֧������(8Ä�2O���[���aF��T�#�4zo�f��UN�ǽ���t=�*�)#6H*sp����
'�*QɊa�C�ɠyX����i��Ġb(e.1%��Rj�)&��b�5٭>l����a9�ݲޚD�o���9���������װTL.`�#[��+k暂�|�@)��F>4�qN�޽���F�gG��#9mSy�IsJh=:���X���6*u�J�f"59&�6;8�����֣�v���>|^���r��6���;����s[�41E	������0�귓�(����~�����:��      �   r   x^3�,��J�.M�<� ���k�9A���\����L�JBR�K8�K�ҀrF�PiC]C.3�thqjHք����H��R�Ȕ˜3�$k�6E��@�lhlVa��"F��� �'h     