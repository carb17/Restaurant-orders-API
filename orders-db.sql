PGDMP  5                     }            orders    17.2    17.2 5    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16390    orders    DATABASE     }   CREATE DATABASE orders WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.utf8';
    DROP DATABASE orders;
                     postgres    false            �            1259    16418    category    TABLE     Z   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(50)
);
    DROP TABLE public.category;
       public         heap r       postgres    false            �            1259    16417    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public               postgres    false    218            �           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public               postgres    false    217            �            1259    16427    dish    TABLE     �   CREATE TABLE public.dish (
    id integer NOT NULL,
    name character varying(100),
    description character varying(200),
    price numeric(10,2),
    category_id integer,
    image text
);
    DROP TABLE public.dish;
       public         heap r       postgres    false            �            1259    16426    dish_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dish_id_seq;
       public               postgres    false    220            �           0    0    dish_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dish_id_seq OWNED BY public.dish.id;
          public               postgres    false    219            �            1259    16499    order_details    TABLE     �   CREATE TABLE public.order_details (
    id integer NOT NULL,
    id_order integer,
    id_product integer,
    quantity integer,
    unit_price numeric(10,2),
    subtotal numeric(10,2)
);
 !   DROP TABLE public.order_details;
       public         heap r       postgres    false            �            1259    16498    order_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.order_details_id_seq;
       public               postgres    false    228            �           0    0    order_details_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;
          public               postgres    false    227            �            1259    16487    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    creation_date timestamp with time zone,
    state integer,
    method_payment character varying(50),
    total_price numeric(10,2),
    client character varying(80)
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            �            1259    16486    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               postgres    false    226            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public               postgres    false    225            �            1259    16476    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(100),
    description character varying(200),
    price numeric(10,2),
    category character varying(50),
    stock integer,
    image text
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    16475    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public               postgres    false    224            �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public               postgres    false    223            �            1259    16469    state_order    TABLE     ]   CREATE TABLE public.state_order (
    id integer NOT NULL,
    name character varying(20)
);
    DROP TABLE public.state_order;
       public         heap r       postgres    false            �            1259    16468    state_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.state_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.state_order_id_seq;
       public               postgres    false    222            �           0    0    state_order_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.state_order_id_seq OWNED BY public.state_order.id;
          public               postgres    false    221            :           2604    16421    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            ;           2604    16430    dish id    DEFAULT     b   ALTER TABLE ONLY public.dish ALTER COLUMN id SET DEFAULT nextval('public.dish_id_seq'::regclass);
 6   ALTER TABLE public.dish ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            ?           2604    16502    order_details id    DEFAULT     t   ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);
 ?   ALTER TABLE public.order_details ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            >           2604    16490 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            =           2604    16479    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            <           2604    16472    state_order id    DEFAULT     p   ALTER TABLE ONLY public.state_order ALTER COLUMN id SET DEFAULT nextval('public.state_order_id_seq'::regclass);
 =   ALTER TABLE public.state_order ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �          0    16418    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public               postgres    false    218   .;       �          0    16427    dish 
   TABLE DATA           P   COPY public.dish (id, name, description, price, category_id, image) FROM stdin;
    public               postgres    false    220   o;       �          0    16499    order_details 
   TABLE DATA           a   COPY public.order_details (id, id_order, id_product, quantity, unit_price, subtotal) FROM stdin;
    public               postgres    false    228   �;       �          0    16487    orders 
   TABLE DATA           _   COPY public.orders (id, creation_date, state, method_payment, total_price, client) FROM stdin;
    public               postgres    false    226   �;       �          0    16476    products 
   TABLE DATA           X   COPY public.products (id, name, description, price, category, stock, image) FROM stdin;
    public               postgres    false    224   Q<       �          0    16469    state_order 
   TABLE DATA           /   COPY public.state_order (id, name) FROM stdin;
    public               postgres    false    222   �<       �           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public               postgres    false    217                        0    0    dish_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.dish_id_seq', 1, true);
          public               postgres    false    219                       0    0    order_details_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.order_details_id_seq', 5, true);
          public               postgres    false    227                       0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 1, true);
          public               postgres    false    225                       0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 1, true);
          public               postgres    false    223                       0    0    state_order_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.state_order_id_seq', 4, true);
          public               postgres    false    221            A           2606    16425    category category_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.category DROP CONSTRAINT category_name_key;
       public                 postgres    false    218            C           2606    16423    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public                 postgres    false    218            E           2606    16436    dish dish_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_name_key;
       public                 postgres    false    220            G           2606    16434    dish dish_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_pkey;
       public                 postgres    false    220            Q           2606    16504     order_details order_details_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_pkey;
       public                 postgres    false    228            O           2606    16492    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    226            K           2606    16485    products products_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT products_name_key;
       public                 postgres    false    224            M           2606    16483    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    224            I           2606    16474    state_order state_order_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.state_order
    ADD CONSTRAINT state_order_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.state_order DROP CONSTRAINT state_order_pkey;
       public                 postgres    false    222            R           2606    16437    dish dish_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);
 D   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_category_id_fkey;
       public               postgres    false    4675    218    220            T           2606    16505 )   order_details order_details_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.orders(id);
 S   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_id_order_fkey;
       public               postgres    false    226    228    4687            U           2606    16510 +   order_details order_details_id_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_id_product_fkey FOREIGN KEY (id_product) REFERENCES public.products(id);
 U   ALTER TABLE ONLY public.order_details DROP CONSTRAINT order_details_id_product_fkey;
       public               postgres    false    228    224    4685            S           2606    16493    orders orders_state_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_state_fkey FOREIGN KEY (state) REFERENCES public.state_order(id);
 B   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_state_fkey;
       public               postgres    false    4681    222    226            �   1   x�3�LI-.N-*�2��M��SH�/-*N�2�L,(H-ɬJ-����� ��      �   O   x���	�  �w2E����	���A�
Q��]�zz�|L� �2S��O�=��'S�&/�*�k�V� xw{� >"��S'      �      x�3�4B#NC=SN#C=�=... .��      �   D   x�3�4202�50�54S00�2��26ճ04�sr&��d�($'�p�p:'�$r��qqq ���      �   W   x���	�  �s�"�C��^�D�@�����P���6VH1�"|��Lxd�#�U;�����}������}a���!��1�/��      �   <   x�3�,H�K��K�2���S((J-H,J,����2�,JML��2�LI��,K-JM����� ��	     