ü!
cD:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Controllers\BlobController.cs
	namespace		 	
azure_blob_storage		
 
.		 
api		  
.		  !
Controllers		! ,
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
BlobController 
:  !
ControllerBase" 0
{ 
private 
readonly 
IBlobService %
_blobService& 2
;2 3
public 
BlobController 
( 
IBlobService *
blobService+ 6
)6 7
{ 	
_blobService 
= 
blobService &
;& '
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetBlobAsync) 5
(5 6
string6 <
blobName= E
)E F
{ 	
var 
data 
= 
await 
_blobService )
.) *
GetBlobAsync* 6
(6 7
blobName7 ?
)? @
;@ A
return 
File 
( 
data 
. 
Content $
,$ %
data& *
.* +
ContentType+ 6
)6 7
;7 8
} 	
[ 	
HttpGet	 
( 
$str 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAllBlobAsync) 8
(8 9
)9 :
{   	
return!! 
Ok!! 
(!! 
await!! 
_blobService!! (
.!!( )
GetAllAsync!!) 4
(!!4 5
)!!5 6
)!!6 7
;!!7 8
}"" 	
[$$ 	
HttpPost$$	 
($$ 
$str$$ 
)$$  
]$$  !
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
UploadFileAsync%%) 8
(%%8 9
[%%9 :
FromBody%%: B
]%%B C
UploadFileRequest%%D U
request%%V ]
)%%] ^
{&& 	
await'' 
_blobService'' 
.'' 
UploadFileBlobAsync'' 2
(''2 3
request''3 :
.'': ;
	FilePatch''; D
,''D E
request''F M
.''M N
FileName''N V
)''V W
;''W X
return(( 
Ok(( 
((( 
)(( 
;(( 
})) 	
[++ 	
HttpPost++	 
(++ 
$str++ "
)++" #
]++# $
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
UploadContentAsync,,) ;
(,,; <
[,,< =
FromBody,,= E
],,E F 
UploadContentRequest,,G [
request,,\ c
),,c d
{-- 	
await.. 
_blobService.. 
... "
UploadContentBlobAsync.. 5
(..5 6
request..6 =
...= >
Content..> E
,..E F
request..G N
...N O
FileName..O W
)..W X
;..X Y
return// 
Ok// 
(// 
)// 
;// 
}00 	
[33 	

HttpDelete33	 
(33 
$str33  
)33  !
]33! "
public44 
async44 
Task44 
<44 
IActionResult44 '
>44' (
DeleteFileAsync44) 8
(448 9
string449 ?
blobName44@ H
)44H I
{55 	
await66 
_blobService66 
.66 
DeleteBlobAsync66 .
(66. /
blobName66/ 7
)667 8
;668 9
return77 
Ok77 
(77 
)77 
;77 
}88 	
}99 
}:: í
bD:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Dtos\UploadContentRequest.cs
	namespace 	
azure_blob_storage
 
. 
api  
.  !
Dtos! %
{ 
public 

class  
UploadContentRequest %
{ 
public 
string 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
FileName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ë
_D:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Dtos\UploadFileRequest.cs
	namespace 	
azure_blob_storage
 
. 
api  
.  !
Queries! (
{ 
public 

class 
UploadFileRequest "
{ 
public 
string 
	FilePatch 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
FileName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ›	
aD:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Extension\FileExtensions.cs
	namespace 	
azure_blob_storage
 
. 
api  
.  !
	Extension! *
{ 
public 

static 
class 
FileExtensions &
{ 
private 
static 
readonly ,
 FileExtensionContentTypeProvider  @
ProviderA I
=J K
newL O,
 FileExtensionContentTypeProviderP p
(p q
)q r
;r s
public		 
static		 
string		 
GetContentType		 +
(		+ ,
this		, 0
string		1 7
fileName		8 @
)		@ A
{

 	
if 
( 
! 
Provider 
. 
TryGetContentType +
(+ ,
fileName, 4
,4 5
out6 9
var: =
contentType> I
)I J
)J K
{ 
contentType 
= 
$str 8
;8 9
} 
return 
contentType 
; 
} 	
} 
} ‚	
`D:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Interfaces\IBlobService.cs
	namespace 	
azure_blob_storage
 
. 
api  
.  !

Interfaces! +
{ 
public 

	interface 
IBlobService !
{ 
Task		 
<		 
BlobInfo		 
>		 
GetBlobAsync		 #
(		# $
string		$ *
blobName		+ 3
)		3 4
;		4 5
Task

 
<

 
IEnumerable

 
<

 
string

 
>

  
>

  !
GetAllAsync

" -
(

- .
)

. /
;

/ 0
Task 
UploadFileBlobAsync  
(  !
string! '
	filePatch( 1
,1 2
string3 9
fileName: B
)B C
;C D
Task "
UploadContentBlobAsync #
(# $
string$ *
content+ 2
,2 3
string4 :
fileName; C
)C D
;D E
Task 
DeleteBlobAsync 
( 
string #
blobName$ ,
), -
;- .
} 
} Å
XD:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Models\BlobInfo.cs
	namespace 	
azure_blob_storage
 
. 
api  
.  !
Models! '
{ 
public 

class 
BlobInfo 
{ 
public 
Stream 
Content 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
ContentType !
{" #
get$ '
;' (
set) ,
;, -
}. /
}		 
}

 –

PD:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Program.cs
	namespace 	
azure_blob_storage
 
. 
api  
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{		 	
CreateHostBuilder

 
(

 
args

 "
)

" #
.

# $
Build

$ )
(

) *
)

* +
.

+ ,
Run

, /
(

/ 0
)

0 1
;

1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ©<
]D:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Services\BlobService.cs
	namespace 	
azure_blob_storage
 
. 
api  
.  !
Services! )
{ 
public 

class 
BlobService 
: 
IBlobService +
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
BlobServiceClient *
_blobServiceClient+ =
;= >
public 
BlobService 
( 
IConfiguration )
configuration* 7
,7 8
BlobServiceClient9 J
blobServiceClientK \
)\ ]
{ 	
_configuration 
= 
configuration *
;* +
_blobServiceClient 
=  
blobServiceClient! 2
;2 3
} 	
public 
async 
Task 
< 
IEnumerable %
<% &
string& ,
>, -
>- .
GetAllAsync/ :
(: ;
); <
{ 	
var 
blob 
= 
_configuration %
.% &
GetValue& .
<. /
string/ 5
>5 6
(6 7
$str7 L
)L M
;M N
var 
containerClient 
=  !
_blobServiceClient" 4
.4 5"
GetBlobContainerClient5 K
(K L
blobL P
)P Q
;Q R
var 
items 
= 
new 
List  
<  !
string! '
>' (
(( )
)) *
;* +
await 
foreach 
( 
var 
blobItem '
in( *
containerClient+ :
.: ;
GetBlobsAsync; H
(H I
)I J
)J K
{   
items!! 
.!! 
Add!! 
(!! 
blobItem!! "
.!!" #
Name!!# '
)!!' (
;!!( )
}"" 
return## 
items## 
;## 
}$$ 	
public&& 
async&& 
Task&& 
<&& 
BlobInfo&& "
>&&" #
GetBlobAsync&&$ 0
(&&0 1
string&&1 7
blobName&&8 @
)&&@ A
{'' 	
var(( 
blob(( 
=(( 
_configuration(( %
.((% &
GetValue((& .
<((. /
string((/ 5
>((5 6
(((6 7
$str((7 U
)((U V
;((V W
var)) 
containerClient)) 
=))  !
_blobServiceClient))" 4
.))4 5"
GetBlobContainerClient))5 K
())K L
blob))L P
)))P Q
;))Q R
var++ 

blobClient++ 
=++ 
containerClient++ ,
.++, -
GetBlobClient++- :
(++: ;
blobName++; C
)++C D
;++D E
var,, 
blobDownloadInfo,,  
=,,! "
await,,# (

blobClient,,) 3
.,,3 4
DownloadAsync,,4 A
(,,A B
),,B C
;,,C D
return-- 
new-- 
BlobInfo-- 
(--  
)--  !
{.. 
Content// 
=// 
blobDownloadInfo// *
.//* +
Value//+ 0
.//0 1
Content//1 8
,//8 9
ContentType00 
=00 
blobDownloadInfo00 .
.00. /
Value00/ 4
.004 5
ContentType005 @
}11 
;11 
}22 	
public44 
async44 
Task44 
UploadFileBlobAsync44 -
(44- .
string44. 4
	filePatch445 >
,44> ?
string44@ F
fileName44G O
)44O P
{55 	
var66 
blob66 
=66 
_configuration66 %
.66% &
GetValue66& .
<66. /
string66/ 5
>665 6
(666 7
$str667 U
)66U V
;66V W
var77 
containerClient77 
=77  !
_blobServiceClient77" 4
.774 5"
GetBlobContainerClient775 K
(77K L
blob77L P
)77P Q
;77Q R
var88 

blobClient88 
=88 
containerClient88 ,
.88, -
GetBlobClient88- :
(88: ;
fileName88; C
)88C D
;88D E
await99 

blobClient99 
.99 
UploadAsync99 (
(99( )
	filePatch99) 2
,992 3
new994 7
BlobHttpHeaders998 G
{99H I
ContentType99J U
=99V W
	filePatch99X a
.99a b
GetContentType99b p
(99p q
)99q r
}99s t
)99t u
;99u v
}:: 	
public<< 
async<< 
Task<< "
UploadContentBlobAsync<< 0
(<<0 1
string<<1 7
content<<8 ?
,<<? @
string<<A G
fileName<<H P
)<<P Q
{== 	
var>> 
blob>> 
=>> 
_configuration>> %
.>>% &
GetValue>>& .
<>>. /
string>>/ 5
>>>5 6
(>>6 7
$str>>7 U
)>>U V
;>>V W
var?? 
containerClient?? 
=??  !
_blobServiceClient??" 4
.??4 5"
GetBlobContainerClient??5 K
(??K L
blob??L P
)??P Q
;??Q R
var@@ 

blobClient@@ 
=@@ 
containerClient@@ ,
.@@, -
GetBlobClient@@- :
(@@: ;
fileName@@; C
)@@C D
;@@D E
varAA 
bytesAA 
=AA 
EncodingAA  
.AA  !
UTF8AA! %
.AA% &
GetBytesAA& .
(AA. /
contentAA/ 6
)AA6 7
;AA7 8
awaitBB 
usingBB 
varBB 
memoryStreamBB (
=BB) *
newBB+ .
MemoryStreamBB/ ;
(BB; <
bytesBB< A
)BBA B
;BBB C
awaitCC 

blobClientCC 
.CC 
UploadAsyncCC (
(CC( )
memoryStreamCC) 5
,CC5 6
newCC7 :
BlobHttpHeadersCC; J
{CCK L
ContentTypeCCM X
=CCY Z
fileNameCC[ c
.CCc d
GetContentTypeCCd r
(CCr s
)CCs t
}CCu v
)CCv w
;CCw x
}DD 	
publicFF 
asyncFF 
TaskFF 
DeleteBlobAsyncFF )
(FF) *
stringFF* 0
blobNameFF1 9
)FF9 :
{GG 	
varHH 
blobHH 
=HH 
_configurationHH %
.HH% &
GetValueHH& .
<HH. /
stringHH/ 5
>HH5 6
(HH6 7
$strHH7 U
)HHU V
;HHV W
varII 
containerClientII 
=II  !
_blobServiceClientII" 4
.II4 5"
GetBlobContainerClientII5 K
(IIK L
blobIIL P
)IIP Q
;IIQ R
varJJ 

blobClientJJ 
=JJ 
containerClientJJ ,
.JJ, -
GetBlobClientJJ- :
(JJ: ;
blobNameJJ; C
)JJC D
;JJD E
awaitLL 

blobClientLL 
.LL 
DeleteIfExistsAsyncLL 0
(LL0 1
)LL1 2
;LL2 3
}NN 	
}PP 
}QQ ƒ
PD:\_Repos\azure-cositas\azure-blob-storage.api\azure-blob-storage.api\Startup.cs
	namespace 	
azure_blob_storage
 
. 
api  
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddSingleton !
(! "
x" #
=>$ &
new' *
BlobServiceClient+ <
(< =
Configuration= J
.J K
GetValueK S
<S T
stringT Z
>Z [
([ \
$str\ s
)s t
)t u
)u v
;v w
services 
. 
AddTransient !
<! "
IBlobService" .
,. /
BlobService0 ;
>; <
(< =
)= >
;> ?
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c   
.   

SwaggerDoc   
(   
$str   !
,  ! "
new  # &
OpenApiInfo  ' 2
{  3 4
Title  5 :
=  ; <
$str  = V
,  V W
Version  X _
=  ` a
$str  b f
}  g h
)  h i
;  i j
}!! 
)!! 
;!! 
}"" 	
public%% 
void%% 
	Configure%% 
(%% 
IApplicationBuilder%% 1
app%%2 5
,%%5 6
IWebHostEnvironment%%7 J
env%%K N
)%%N O
{&& 	
if'' 
('' 
env'' 
.'' 
IsDevelopment'' !
(''! "
)''" #
)''# $
{(( 
app)) 
.)) %
UseDeveloperExceptionPage)) -
())- .
))). /
;))/ 0
app** 
.** 

UseSwagger** 
(** 
)**  
;**  !
app++ 
.++ 
UseSwaggerUI++  
(++  !
c++! "
=>++# %
c++& '
.++' (
SwaggerEndpoint++( 7
(++7 8
$str++8 R
,++R S
$str++T m
)++m n
)++n o
;++o p
},, 
app.. 
... 
UseHttpsRedirection.. #
(..# $
)..$ %
;..% &
app00 
.00 

UseRouting00 
(00 
)00 
;00 
app22 
.22 
UseAuthorization22  
(22  !
)22! "
;22" #
app44 
.44 
UseEndpoints44 
(44 
	endpoints44 &
=>44' )
{55 
	endpoints66 
.66 
MapControllers66 (
(66( )
)66) *
;66* +
}77 
)77 
;77 
}88 	
}99 
}:: 