FasdUAS 1.101.10   ��   ��    l    ����  Q      ��  k        	  l   �� 
 ��   
  # Ask about Login Item     �   , #   A s k   a b o u t   L o g i n   I t e m 	     Q    +     I   �� ��
�� .sysoexecTEXT���     TEXT  m       �   b d e f a u l t s   r e a d   c o m . z i b i t y . b r o o m s t i c k   B M I O l o g i n i t e m��    R      ������
�� .ascrerr ****      � ****��  ��    I   +�� ��
�� .sysoexecTEXT���     TEXT  b    '    m       �   f d e f a u l t s   w r i t e   c o m . z i b i t y . b r o o m s t i c k   B M I O l o g i n i t e m    n    &    1   $ &��
�� 
strq  n    $    1   " $��
�� 
bhit  l   " ����  I   "��   
�� .sysodisAaleR        TEXT  m     ! ! � " " z W o u l d   y o u   l i k e   B r o o m s t i c k   t o   o r d e r   y o u r   i c o n s   w h e n   y o u   l o g i n ?   �� # $
�� 
mesS # m     % % � & &� I f   y o u ' d   l i k e   i t ,   B r o o m s t i c k   c a n   a u t o m a t i c a l l y   o r d e r   y o u r   i c o n s   f o r   y o u   w h e n   y o u   l o g   i n   t o   y o u r   c o m p u t e r .   I f   y o u   d o n ' t   c h o o s e   t o   d o   t h i s ,   y o u   w i l l   h a v e   t o   m a n u a l l y   o p e n   B r o o m s t i c k   a n d   a s k   i t   t o   o r d e r   y o u r   i c o n s   f o r   y o u . 
 
 W o u l d   y o u   l i k e   t h i s ? $ �� ' (
�� 
btns ' J     ) )  * + * m     , , � - -  N o +  .�� . m     / / � 0 0  Y e s��   ( �� 1��
�� 
dflt 1 m    ���� ��  ��  ��  ��     2 3 2 l  , ,��������  ��  ��   3  4 5 4 l  , ,�� 6 7��   6  # Get Applist    7 � 8 8  #   G e t   A p p l i s t 5  9 : 9 Q   , I ; < = ; r   / : > ? > I  / 6�� @��
�� .sysoexecTEXT���     TEXT @ m   / 2 A A � B B X d e f a u l t s   r e a d   c o m . z i b i t y . b r o o m s t i c k   a p p o r d e r��   ? o      ���� 0 applist AppList < R      ������
�� .ascrerr ****      � ****��  ��   = r   B I C D C m   B E E E � F F   D o      ���� 0 applist AppList :  G H G r   J U I J I m   J M K K � L L  | J n      M N M 1   P T��
�� 
txdl N 1   M P��
�� 
ascr H  O P O r   V a Q R Q n   V ] S T S 2  Y ]��
�� 
citm T o   V Y���� 0 applist AppList R o      ���� 0 applist AppList P  U V U r   b m W X W m   b e Y Y � Z Z   X n      [ \ [ 1   h l��
�� 
txdl \ 1   e h��
�� 
ascr V  ] ^ ] l  n n��������  ��  ��   ^  _ ` _ l  n n�� a b��   a  # Quit All AppList apps    b � c c . #   Q u i t   A l l   A p p L i s t   a p p s `  d e d Y   n � f�� g h�� f Q   � � i j�� i I  � ��� k��
�� .sysoexecTEXT���     TEXT k b   � � l m l m   � � n n � o o  k i l l a l l   m n   � � p q p 1   � ���
�� 
strq q n   � � r s r 4   � ��� t
�� 
cobj t o   � ����� 0 i   s o   � ����� 0 applist AppList��   j R      ������
�� .ascrerr ****      � ****��  ��  ��  �� 0 i   g m   q r����  h n   r ~ u v u m   y }��
�� 
nmbr v n  r y w x w 2  u y��
�� 
cobj x o   r u���� 0 applist AppList��   e  y z y l  � ���������  ��  ��   z  { | { l  � ��� } ~��   } $ # Launch AppList apps in order    ~ �   < #   L a u n c h   A p p L i s t   a p p s   i n   o r d e r |  � � � Y   �u ��� � ��� � k   �p � �  � � � r   � � � � � n   � � � � � 4   � ��� �
�� 
cobj � o   � ����� 0 i   � o   � ����� 0 applist AppList � o      ���� 0 	this_item   �  ��� � Q   �p � ��� � k   �g � �  � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � m   � � � � � � �  o p e n   - a   � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 	this_item  ��   �  ��� � O   �g � � � k   �f � �  � � � W   � � � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � � � � ?���������   � E   � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
pnam � 2  � ���
�� 
prcs��  ��   � o   � ����� 0 	this_item   �  � � � Q   �< � ��� � Z 3 � ����� � >  � � � l 	 ����� � I 	�� ���
�� .sysoexecTEXT���     TEXT � m   � � � � � b d e f a u l t s   r e a d   c o m . z i b i t y . b r o o m s t i c k   B M I O l o g i n i t e m��  ��  ��   � m  	 � � � � �  N o � Z / � ����� � I �� ���
�� .coredoexbool       obj  � 4  �� �
�� 
logi � o  ���� 0 	this_item  ��   � I +�� ���
�� .coredelonull���    ditm � 4  '�� �
�� 
logi � o  #&���� 0 	this_item  ��  ��  ��  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��   �  � � � I =D�� ���
�� .sysodelanull��� ��� nmbr � m  =@ � � ?�      ��   �  ��� � Q  Ef � ��� � Z H] � ����� � = HO � � � o  HK���� 0 	this_item   � m  KN � � � � �  D r o p b o x � I RY�� ���
�� .sysodelanull��� ��� nmbr � m  RU���� ��  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��   � m   � � � ��                                                                                  sevs  alis    �  Macintosh HD               ʶC�H+  �?NSystem Events.app                                              �o����        ����  	                CoreServices    ʵ�      ���    �?N�?H�?G  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  �� 0 i   � m   � �����  � n   � � � � � m   � ���
�� 
nmbr � n  � � � � � 2  � ���
�� 
cobj � o   � ����� 0 applist AppList��   �  � � � l vv��������  ��  ��   �  � � � l vv� � ��   �  # Make login item    � � � � " #   M a k e   l o g i n   i t e m �  ��~ � Z  v � ��}�| � > v� � � � l v} ��{�z � I v}�y ��x
�y .sysoexecTEXT���     TEXT � m  vy � � � � � b d e f a u l t s   r e a d   c o m . z i b i t y . b r o o m s t i c k   B M I O l o g i n i t e m�x  �{  �z   � m  }� � � � � �  N o � O  �� � � � k  �� � �  � � � Z �� � ��w�v � I ���u ��t
�u .coredoexbool       obj  � 4  ���s �
�s 
logi � m  �� � � � � � > B r o o m s t i c k   M e n u b a r   I c o n   O r d e r e r�t   � I ���r ��q
�r .coredelonull���    ditm � 4  ���p �
�p 
logi � m  �� � � � � � > B r o o m s t i c k   M e n u b a r   I c o n   O r d e r e r�q  �w  �v   �  � � � r  �� � � � l �� ��o�n � n  �� � � � 1  ���m
�m 
posx � l �� ��l�k � I ���j ��i
�j .earsffdralis        afdr �  f  ���i  �l  �k  �o  �n   � o      �h�h 0 fpath FPath �  ��g � Z �� � ��f�e � = �� � � � l �� ��d�c � I ���b �a
�b .coredoexbool       obj   4  ���`
�` 
logi m  �� � > B r o o m s t i c k   M e n u b a r   I c o n   O r d e r e r�a  �d  �c   � m  ���_
�_ boovfals � I ���^�]
�^ .corecrel****      � null�]   �\
�\ 
kocl m  ���[
�[ 
logi �Z
�Z 
insh n  ��	
	  ;  ��
 2 ���Y
�Y 
logi �X�W
�X 
prdt K  �� �V
�V 
ppth o  ���U�U 0 fpath FPath �T
�T 
hidn m  ���S
�S boovtrue �R
�R 
kind m  ���Q
�Q 
capp �P�O
�P 
pnam m  �� � > B r o o m s t i c k   M e n u b a r   I c o n   O r d e r e r�O  �W  �f  �e  �g   � m  ���                                                                                  sevs  alis    �  Macintosh HD               ʶC�H+  �?NSystem Events.app                                              �o����        ����  	                CoreServices    ʵ�      ���    �?N�?H�?G  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �}  �|  �~    R      �N�M�L
�N .ascrerr ****      � ****�M  �L  ��  ��  ��       �K�K   �J�I�H�G
�J .aevtoappnull  �   � ****�I 0 applist AppList�H 0 	this_item  �G 0 fpath FPath �F�E�D�C
�F .aevtoappnull  �   � **** k      �B�B  �E  �D   �A�A 0 i   < �@�?�>  !�= %�< , /�;�:�9�8�7 A�6 E K�5�4�3 Y�2�1 n�0 � ��/�. ��- � ��,�+�* � ��) � � � ��(�'�&�%�$�#�"�!� ���
�@ .sysoexecTEXT���     TEXT�?  �>  
�= 
mesS
�< 
btns
�; 
dflt�: 
�9 .sysodisAaleR        TEXT
�8 
bhit
�7 
strq�6 0 applist AppList
�5 
ascr
�4 
txdl
�3 
citm
�2 
cobj
�1 
nmbr�0 0 	this_item  
�/ 
prcs
�. 
pnam
�- .sysodelanull��� ��� nmbr
�, 
logi
�+ .coredoexbool       obj 
�* .coredelonull���    ditm�) 
�( .earsffdralis        afdr
�' 
posx�& 0 fpath FPath
�% 
kocl
�$ 
insh
�# 
prdt
�" 
ppth
�! 
hidn
�  
kind
� 
capp� 
� .corecrel****      � null�C 
�j W X  �������lv�l� �,�,%j O a j E` W X  a E` Oa _ a ,FO_ a -E` Oa _ a ,FO 7k_ a -a ,Ekh   a _ a �/�,%j W X  h[OY��O �k_ a -a ,Ekh  _ a �/E` O �a _ �,%j Oa  � h*a -a ,_ a  j ![OY��O 6a "j a # $*a $_ /j % *a $_ /j &Y hY hW X  hOa 'j !O _ a (  a )j !Y hW X  hUW X  h[OY�FOa *j a + �a  v*a $a ,/j % *a $a -/j &Y hO)j .a /,E` 0O*a $a 1/j %f  6*a 2a $a 3*a $-6a 4a 5_ 0a 6ea 7a 8a a 9a :� ;Y hUY hW X  h � �    !"#$%����������! �&&  G o o g l e   D r i v e" �''  D r o p b o x# �(( " M a i l T a b   f o r   G m a i l$ �)) ( M e n u T a b   f o r   F a c e b o o k% �**  C a f f e i n e �++  F l u x�  �  �  �  �  �  �  �  �  �   �,, / U s e r s / S e b a s t i a n / D e v e l o p m e n t / A p p l i c a t i o n s / B r o o m s t i c k / B r o o m s t i c k . a p p / C o n t e n t s / R e s o u r c e s / S c r i p t s / B r o o m s t i c k   M e n u b a r   I c o n   O r d e r e r . a p pascr  ��ޭ