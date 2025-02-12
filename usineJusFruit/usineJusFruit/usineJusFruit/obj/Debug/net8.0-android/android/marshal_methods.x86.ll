; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [343 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [680 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 253
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 287
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 305
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 314
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 57725457, ; 10: it\Microsoft.Data.SqlClient.resources => 0x370d211 => 298
	i32 57727992, ; 11: ja\Microsoft.Data.SqlClient.resources => 0x370dbf8 => 299
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 13: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 338
	i32 68219467, ; 14: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 15: Microsoft.Maui.Graphics.dll => 0x44bb714 => 203
	i32 82292897, ; 16: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 17: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 322
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 271
	i32 117431740, ; 19: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 20: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 271
	i32 122350210, ; 21: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 291
	i32 136584136, ; 23: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 337
	i32 140062828, ; 24: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 330
	i32 142721839, ; 25: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 26: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 27: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 28: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 227
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 273
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 32: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 33: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 225
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 247
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 230
	i32 264223668, ; 41: zh-Hans\Microsoft.Data.SqlClient.resources => 0xfbfbbb4 => 303
	i32 272650997, ; 42: ko\Microsoft.Data.SqlClient.resources.dll => 0x104052f5 => 300
	i32 276479776, ; 43: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 44: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 249
	i32 280482487, ; 45: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 246
	i32 291076382, ; 46: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 335
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 216
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 51: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 313
	i32 330147069, ; 52: Microsoft.SqlServer.Server => 0x13ada4fd => 204
	i32 342366114, ; 53: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 248
	i32 360082299, ; 54: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 55: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 56: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 57: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 58: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 59: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 60: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 61: _Microsoft.Android.Resource.Designer => 0x17969339 => 339
	i32 403441872, ; 62: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 63: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 333
	i32 441335492, ; 64: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 231
	i32 442565967, ; 65: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 66: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 244
	i32 451504562, ; 67: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 68: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 69: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 70: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 71: System.dll => 0x1bff388e => 164
	i32 476646585, ; 72: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 246
	i32 485463106, ; 73: Microsoft.IdentityModel.Abstractions => 0x1cef9442 => 192
	i32 486930444, ; 74: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 259
	i32 489220957, ; 75: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 311
	i32 498788369, ; 76: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 77: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 189
	i32 526420162, ; 78: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 79: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 291
	i32 530272170, ; 80: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 535369068, ; 81: fr\Microsoft.Data.SqlClient.resources.dll => 0x1fe9156c => 297
	i32 538707440, ; 82: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 332
	i32 539058512, ; 83: Microsoft.Extensions.Logging => 0x20216150 => 185
	i32 540030774, ; 84: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 85: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 86: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 547209430, ; 87: ja\Microsoft.Data.SqlClient.resources.dll => 0x209dc0d6 => 299
	i32 548916678, ; 88: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 179
	i32 549171840, ; 89: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 90: Jsr305Binding => 0x213954e7 => 284
	i32 569601784, ; 91: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 282
	i32 577335427, ; 92: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 597488923, ; 93: CommunityToolkit.Maui => 0x239cf51b => 175
	i32 601371474, ; 94: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 95: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 96: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 97: Xamarin.AndroidX.CustomView => 0x2568904f => 236
	i32 627931235, ; 98: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 324
	i32 639843206, ; 99: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 242
	i32 643868501, ; 100: System.Net => 0x2660a755 => 81
	i32 662205335, ; 101: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 102: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 278
	i32 666292255, ; 103: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 223
	i32 672442732, ; 104: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 105: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 106: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 107: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 293
	i32 693804605, ; 108: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 109: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 110: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 288
	i32 700358131, ; 111: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 112: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 292
	i32 722857257, ; 113: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 723796036, ; 114: System.ClientModel.dll => 0x2b244044 => 205
	i32 735137430, ; 115: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 116: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 117: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 213
	i32 759454413, ; 118: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 119: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 120: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 121: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 330
	i32 789151979, ; 122: Microsoft.Extensions.Options => 0x2f0980eb => 188
	i32 790371945, ; 123: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 237
	i32 804715423, ; 124: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 251
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 129: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 130: Xamarin.AndroidX.Print => 0x3246f6cd => 264
	i32 869139383, ; 131: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 315
	i32 873119928, ; 132: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 133: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 134: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 135: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 329
	i32 904024072, ; 136: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 137: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 138: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 326
	i32 928116545, ; 139: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 287
	i32 952186615, ; 140: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956528696, ; 141: zh-Hans\Microsoft.Data.SqlClient.resources.dll => 0x39037838 => 303
	i32 956575887, ; 142: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 292
	i32 961460050, ; 143: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 319
	i32 966729478, ; 144: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 285
	i32 967690846, ; 145: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 248
	i32 975236339, ; 146: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 147: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 148: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 149: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 150: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 328
	i32 992768348, ; 151: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 152: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 153: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 154: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 268
	i32 1019214401, ; 155: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 156: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 184
	i32 1031528504, ; 157: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 286
	i32 1035644815, ; 158: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 221
	i32 1036536393, ; 159: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 160: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 309
	i32 1044663988, ; 161: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 162: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 255
	i32 1062017875, ; 163: Microsoft.Identity.Client.Extensions.Msal => 0x3f4d1b53 => 191
	i32 1067306892, ; 164: GoogleGson => 0x3f9dcf8c => 178
	i32 1082857460, ; 165: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 166: Xamarin.Kotlin.StdLib => 0x409e66d8 => 289
	i32 1089913930, ; 167: System.Diagnostics.EventLog.dll => 0x40f6c44a => 207
	i32 1098259244, ; 168: System => 0x41761b2c => 164
	i32 1108272742, ; 169: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 331
	i32 1117529484, ; 170: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 325
	i32 1118262833, ; 171: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 321
	i32 1121599056, ; 172: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 254
	i32 1127624469, ; 173: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 187
	i32 1138436374, ; 174: Microsoft.Data.SqlClient.dll => 0x43db2916 => 180
	i32 1149092582, ; 175: Xamarin.AndroidX.Window => 0x447dc2e6 => 281
	i32 1168523401, ; 176: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 327
	i32 1170634674, ; 177: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 178: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 277
	i32 1178241025, ; 179: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 262
	i32 1204270330, ; 180: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 223
	i32 1208641965, ; 181: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 182: CommunityToolkit.Mvvm => 0x4868cc7b => 177
	i32 1219128291, ; 183: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 184: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 282
	i32 1253011324, ; 185: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 186: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 307
	i32 1264511973, ; 187: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 272
	i32 1267360935, ; 188: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 276
	i32 1273260888, ; 189: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 228
	i32 1275534314, ; 190: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 293
	i32 1278448581, ; 191: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 220
	i32 1293217323, ; 192: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 239
	i32 1308624726, ; 193: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 316
	i32 1309188875, ; 194: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 195: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 281
	i32 1324164729, ; 196: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 197: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 198: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 336
	i32 1364015309, ; 199: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 200: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 337
	i32 1376866003, ; 201: Xamarin.AndroidX.SavedState => 0x52114ed3 => 268
	i32 1379779777, ; 202: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 203: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 204: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 232
	i32 1408764838, ; 205: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 206: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 207: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 208: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 305
	i32 1434145427, ; 209: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 210: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 285
	i32 1439761251, ; 211: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 212: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 213: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 214: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 215: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1460893475, ; 216: System.IdentityModel.Tokens.Jwt => 0x57137723 => 208
	i32 1461004990, ; 217: es\Microsoft.Maui.Controls.resources => 0x57152abe => 311
	i32 1461234159, ; 218: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 219: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 220: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 221: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 222
	i32 1470490898, ; 222: Microsoft.Extensions.Primitives => 0x57a5e912 => 189
	i32 1479771757, ; 223: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 224: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 225: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 226: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 269
	i32 1498168481, ; 227: Microsoft.IdentityModel.JsonWebTokens.dll => 0x594c3ca1 => 193
	i32 1526286932, ; 228: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 335
	i32 1536373174, ; 229: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 230: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 231: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 232: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565310744, ; 233: System.Runtime.Caching => 0x5d4cbf18 => 210
	i32 1565862583, ; 234: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 235: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 236: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 237: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582305585, ; 238: Azure.Identity => 0x5e501131 => 174
	i32 1582372066, ; 239: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 238
	i32 1592978981, ; 240: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1596263029, ; 241: zh-Hant\Microsoft.Data.SqlClient.resources => 0x5f250a75 => 304
	i32 1597949149, ; 242: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 286
	i32 1601112923, ; 243: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 244: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 245: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 246: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 258
	i32 1622358360, ; 247: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 248: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 280
	i32 1628113371, ; 249: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x610b09db => 196
	i32 1634654947, ; 250: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 176
	i32 1635184631, ; 251: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 242
	i32 1636350590, ; 252: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 235
	i32 1639515021, ; 253: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 254: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 255: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 256: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 257: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 274
	i32 1658251792, ; 258: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 283
	i32 1670060433, ; 259: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 230
	i32 1675553242, ; 260: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 261: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 262: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 263: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 264: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 265: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 266: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 290
	i32 1701541528, ; 267: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 268: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 251
	i32 1726116996, ; 269: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 270: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 271: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 226
	i32 1743415430, ; 272: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 306
	i32 1744735666, ; 273: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 274: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 275: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 276: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 277: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 278: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 279: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 273
	i32 1770582343, ; 280: Microsoft.Extensions.Logging.dll => 0x6988f147 => 185
	i32 1776026572, ; 281: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 282: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 283: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 284: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 322
	i32 1788241197, ; 285: Xamarin.AndroidX.Fragment => 0x6a96652d => 244
	i32 1793755602, ; 286: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 314
	i32 1794500907, ; 287: Microsoft.Identity.Client.dll => 0x6af5e92b => 190
	i32 1796167890, ; 288: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 179
	i32 1798832757, ; 289: es\Microsoft.Data.SqlClient.resources.dll => 0x6b380275 => 296
	i32 1808609942, ; 290: Xamarin.AndroidX.Loader => 0x6bcd3296 => 258
	i32 1813058853, ; 291: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 289
	i32 1813201214, ; 292: Xamarin.Google.Android.Material => 0x6c13413e => 283
	i32 1818569960, ; 293: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 263
	i32 1818787751, ; 294: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 295: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 296: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1824744702, ; 297: ru\Microsoft.Data.SqlClient.resources.dll => 0x6cc364fe => 302
	i32 1828688058, ; 298: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 186
	i32 1847515442, ; 299: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 213
	i32 1853025655, ; 300: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 331
	i32 1858542181, ; 301: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 302: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1871986876, ; 303: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0x6f9440bc => 196
	i32 1875935024, ; 304: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 313
	i32 1879696579, ; 305: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 306: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 224
	i32 1888955245, ; 307: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 308: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 309: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 307
	i32 1898237753, ; 310: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 311: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 312: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 313: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 314: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 318
	i32 1956758971, ; 315: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 316: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 270
	i32 1968388702, ; 317: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 181
	i32 1972739173, ; 318: usineJusFruit.dll => 0x75959c65 => 0
	i32 1983156543, ; 319: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 290
	i32 1985761444, ; 320: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 215
	i32 1986222447, ; 321: Microsoft.IdentityModel.Tokens.dll => 0x7663596f => 197
	i32 2003115576, ; 322: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 310
	i32 2011961780, ; 323: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 324: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 255
	i32 2031763787, ; 325: Xamarin.Android.Glide => 0x791a414b => 212
	i32 2040764568, ; 326: Microsoft.Identity.Client.Extensions.Msal.dll => 0x79a39898 => 191
	i32 2045470958, ; 327: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 328: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 250
	i32 2060060697, ; 329: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 330: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 309
	i32 2070888862, ; 331: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 332: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 333: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 334: System.Console => 0x7ec9ffe9 => 20
	i32 2131193692, ; 335: pt-BR\Microsoft.Data.SqlClient.resources.dll => 0x7f076f5c => 301
	i32 2134056115, ; 336: zh-Hant\Microsoft.Data.SqlClient.resources.dll => 0x7f331cb3 => 304
	i32 2142473426, ; 337: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 338: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 339: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 340: Microsoft.Maui => 0x80bd55ad => 201
	i32 2169148018, ; 341: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 317
	i32 2181898931, ; 342: Microsoft.Extensions.Options.dll => 0x820d22b3 => 188
	i32 2192057212, ; 343: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 186
	i32 2193016926, ; 344: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 345: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 294
	i32 2201231467, ; 346: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 347: it\Microsoft.Maui.Controls.resources => 0x839595db => 319
	i32 2217644978, ; 348: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 277
	i32 2222056684, ; 349: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2228745826, ; 350: pt-BR\Microsoft.Data.SqlClient.resources => 0x84d7f662 => 301
	i32 2244775296, ; 351: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 259
	i32 2252106437, ; 352: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2253551641, ; 353: Microsoft.IdentityModel.Protocols => 0x86527819 => 195
	i32 2256313426, ; 354: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 355: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 356: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 182
	i32 2267999099, ; 357: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 214
	i32 2279755925, ; 358: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 266
	i32 2293034957, ; 359: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 360: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 361: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 362: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 323
	i32 2305521784, ; 363: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2309278602, ; 364: ko\Microsoft.Data.SqlClient.resources => 0x89a4cb8a => 300
	i32 2315684594, ; 365: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 218
	i32 2320631194, ; 366: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 367: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 368: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 369: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 370: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 317
	i32 2368005991, ; 371: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2369706906, ; 372: Microsoft.IdentityModel.Logging => 0x8d3edb9a => 194
	i32 2371007202, ; 373: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 181
	i32 2378619854, ; 374: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 375: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 376: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 318
	i32 2401565422, ; 377: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 378: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 241
	i32 2421380589, ; 379: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 380: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 228
	i32 2427813419, ; 381: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 315
	i32 2435356389, ; 382: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 383: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 384: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 385: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 386: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 387: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 231
	i32 2471841756, ; 388: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 389: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 390: Microsoft.Maui.Controls => 0x93dba8a1 => 199
	i32 2483903535, ; 391: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 392: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 393: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 394: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 395: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 321
	i32 2505896520, ; 396: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 253
	i32 2509217888, ; 397: System.Diagnostics.EventLog => 0x958fa060 => 207
	i32 2522472828, ; 398: Xamarin.Android.Glide.dll => 0x9659e17c => 212
	i32 2538310050, ; 399: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2540434582, ; 400: de\Microsoft.Data.SqlClient.resources.dll => 0x976bf496 => 295
	i32 2549539346, ; 401: usineJusFruit => 0x97f6e212 => 0
	i32 2550873716, ; 402: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 316
	i32 2562349572, ; 403: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 404: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 405: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 320
	i32 2581783588, ; 406: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 254
	i32 2581819634, ; 407: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 276
	i32 2585220780, ; 408: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 409: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 410: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 411: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 325
	i32 2605712449, ; 412: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 294
	i32 2615233544, ; 413: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 245
	i32 2616218305, ; 414: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 187
	i32 2617129537, ; 415: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 416: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 417: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 235
	i32 2624644809, ; 418: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 240
	i32 2626831493, ; 419: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 320
	i32 2627185994, ; 420: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2628210652, ; 421: System.Memory.Data => 0x9ca74fdc => 209
	i32 2629843544, ; 422: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 423: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 249
	i32 2640290731, ; 424: Microsoft.IdentityModel.Logging.dll => 0x9d5fa3ab => 194
	i32 2640706905, ; 425: Azure.Core => 0x9d65fd59 => 173
	i32 2660759594, ; 426: System.Security.Cryptography.ProtectedData.dll => 0x9e97f82a => 211
	i32 2663391936, ; 427: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 214
	i32 2663698177, ; 428: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 429: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 430: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 431: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2677098746, ; 432: Azure.Identity.dll => 0x9f9148fa => 174
	i32 2686887180, ; 433: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 434: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 435: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 274
	i32 2715334215, ; 436: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 437: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 438: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 439: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 440: Xamarin.AndroidX.Activity => 0xa2e0939b => 216
	i32 2735172069, ; 441: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 442: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 222
	i32 2740051746, ; 443: Microsoft.Identity.Client => 0xa351df22 => 190
	i32 2740698338, ; 444: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 306
	i32 2740948882, ; 445: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 446: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 447: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 326
	i32 2755098380, ; 448: Microsoft.SqlServer.Server.dll => 0xa437770c => 204
	i32 2758225723, ; 449: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 200
	i32 2764765095, ; 450: Microsoft.Maui.dll => 0xa4caf7a7 => 201
	i32 2765824710, ; 451: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 452: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 288
	i32 2778768386, ; 453: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 279
	i32 2779977773, ; 454: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 267
	i32 2785988530, ; 455: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 332
	i32 2788224221, ; 456: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 245
	i32 2801831435, ; 457: Microsoft.Maui.Graphics => 0xa7008e0b => 203
	i32 2803228030, ; 458: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 459: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 232
	i32 2819470561, ; 460: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 461: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 462: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 267
	i32 2824502124, ; 463: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 464: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 256
	i32 2849599387, ; 465: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 466: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 279
	i32 2855708567, ; 467: Xamarin.AndroidX.Transition => 0xaa36a797 => 275
	i32 2861098320, ; 468: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 469: Microsoft.Maui.Essentials => 0xaa8a4878 => 202
	i32 2867946736, ; 470: System.Security.Cryptography.ProtectedData => 0xaaf164f0 => 211
	i32 2868488919, ; 471: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 176
	i32 2870099610, ; 472: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 217
	i32 2875164099, ; 473: Jsr305Binding.dll => 0xab5f85c3 => 284
	i32 2875220617, ; 474: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 475: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 243
	i32 2887636118, ; 476: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 477: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 478: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 479: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 480: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 481: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 482: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 280
	i32 2919462931, ; 483: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 484: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 219
	i32 2936416060, ; 485: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 486: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 487: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2944313911, ; 488: System.Configuration.ConfigurationManager.dll => 0xaf7eaa37 => 206
	i32 2959614098, ; 489: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 490: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 491: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 492: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 239
	i32 2987532451, ; 493: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 270
	i32 2996846495, ; 494: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 252
	i32 3012788804, ; 495: System.Configuration.ConfigurationManager => 0xb3938244 => 206
	i32 3016983068, ; 496: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 272
	i32 3023353419, ; 497: WindowsBase.dll => 0xb434b64b => 165
	i32 3023511517, ; 498: ru\Microsoft.Data.SqlClient.resources => 0xb4371fdd => 302
	i32 3024354802, ; 499: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 247
	i32 3033605958, ; 500: System.Memory.Data.dll => 0xb4d12746 => 209
	i32 3038032645, ; 501: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 339
	i32 3053864966, ; 502: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 312
	i32 3056245963, ; 503: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 269
	i32 3057625584, ; 504: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 260
	i32 3059408633, ; 505: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 506: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 507: System.Threading.Tasks => 0xb755818f => 144
	i32 3084678329, ; 508: Microsoft.IdentityModel.Tokens => 0xb7dc74b9 => 197
	i32 3090735792, ; 509: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 510: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 511: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 512: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 513: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 514: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 515: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 516: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 517: GoogleGson.dll => 0xbba64c02 => 178
	i32 3159123045, ; 518: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 519: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 520: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 261
	i32 3192346100, ; 521: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 522: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 523: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 524: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 525: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 238
	i32 3220365878, ; 526: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 527: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 528: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 529: Xamarin.AndroidX.CardView => 0xc235e84d => 226
	i32 3265493905, ; 530: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 531: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 532: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 533: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 534: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 535: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 536: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 537: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 538: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 312
	i32 3312457198, ; 539: Microsoft.IdentityModel.JsonWebTokens => 0xc57015ee => 193
	i32 3316684772, ; 540: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 541: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 236
	i32 3317144872, ; 542: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 543: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 224
	i32 3343947874, ; 544: fr\Microsoft.Data.SqlClient.resources => 0xc7509862 => 297
	i32 3345895724, ; 545: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 265
	i32 3346324047, ; 546: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 262
	i32 3357674450, ; 547: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 329
	i32 3358260929, ; 548: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 549: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 217
	i32 3362522851, ; 550: Xamarin.AndroidX.Core => 0xc86c06e3 => 233
	i32 3366347497, ; 551: Java.Interop => 0xc8a662e9 => 168
	i32 3374879918, ; 552: Microsoft.IdentityModel.Protocols.dll => 0xc92894ae => 195
	i32 3374999561, ; 553: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 266
	i32 3381016424, ; 554: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 308
	i32 3395150330, ; 555: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 556: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 557: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 237
	i32 3428513518, ; 558: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 183
	i32 3429136800, ; 559: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 560: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 561: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 240
	i32 3445260447, ; 562: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 563: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 198
	i32 3458724246, ; 564: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 327
	i32 3471940407, ; 565: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 566: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 567: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 328
	i32 3485117614, ; 568: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 569: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 570: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 229
	i32 3509114376, ; 571: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 572: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 573: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 574: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3545306353, ; 575: Microsoft.Data.SqlClient => 0xd35114f1 => 180
	i32 3555084973, ; 576: de\Microsoft.Data.SqlClient.resources => 0xd3e64aad => 295
	i32 3558648585, ; 577: System.ClientModel => 0xd41cab09 => 205
	i32 3560100363, ; 578: System.Threading.Timer => 0xd432d20b => 147
	i32 3561949811, ; 579: Azure.Core.dll => 0xd44f0a73 => 173
	i32 3570554715, ; 580: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3570608287, ; 581: System.Runtime.Caching.dll => 0xd4d3289f => 210
	i32 3580758918, ; 582: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 336
	i32 3592228221, ; 583: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 338
	i32 3597029428, ; 584: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 215
	i32 3598340787, ; 585: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 586: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 587: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 588: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 264
	i32 3633644679, ; 589: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 219
	i32 3638274909, ; 590: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 591: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 250
	i32 3643446276, ; 592: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 333
	i32 3643854240, ; 593: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 261
	i32 3645089577, ; 594: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 595: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 182
	i32 3660523487, ; 596: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 597: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 598: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 225
	i32 3684561358, ; 599: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 229
	i32 3700591436, ; 600: Microsoft.IdentityModel.Abstractions.dll => 0xdc928b4c => 192
	i32 3700866549, ; 601: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 602: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 234
	i32 3716563718, ; 603: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 604: Xamarin.AndroidX.Annotation => 0xdda814c6 => 218
	i32 3724971120, ; 605: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 260
	i32 3732100267, ; 606: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 607: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 608: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 609: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 610: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 308
	i32 3786282454, ; 611: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 227
	i32 3792276235, ; 612: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 613: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 198
	i32 3802395368, ; 614: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 615: CommunityToolkit.Maui.dll => 0xe3886bf7 => 175
	i32 3819260425, ; 616: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 617: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 618: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 619: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 184
	i32 3844307129, ; 620: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3848348906, ; 621: es\Microsoft.Data.SqlClient.resources => 0xe56124ea => 296
	i32 3849253459, ; 622: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 623: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 624: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 625: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 626: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 627: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 275
	i32 3888767677, ; 628: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 265
	i32 3896106733, ; 629: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 630: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 233
	i32 3901907137, ; 631: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 632: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 324
	i32 3920810846, ; 633: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 634: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 278
	i32 3928044579, ; 635: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 636: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 637: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 263
	i32 3945713374, ; 638: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3948965564, ; 639: it\Microsoft.Data.SqlClient.resources.dll => 0xeb606ebc => 298
	i32 3953953790, ; 640: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 641: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 221
	i32 3959773229, ; 642: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 252
	i32 4003436829, ; 643: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 644: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 220
	i32 4025784931, ; 645: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 646: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 200
	i32 4054681211, ; 647: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 648: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 649: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 650: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 310
	i32 4094352644, ; 651: Microsoft.Maui.Essentials.dll => 0xf40add04 => 202
	i32 4099507663, ; 652: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 653: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 654: Xamarin.AndroidX.Emoji2 => 0xf479582c => 241
	i32 4103439459, ; 655: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 334
	i32 4126470640, ; 656: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 183
	i32 4127667938, ; 657: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 658: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 659: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 660: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 334
	i32 4151237749, ; 661: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 662: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 663: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 664: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 665: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 666: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 257
	i32 4185676441, ; 667: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 668: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 669: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 670: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 323
	i32 4256097574, ; 671: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 234
	i32 4258378803, ; 672: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 256
	i32 4260525087, ; 673: System.Buffers => 0xfdf2741f => 7
	i32 4263231520, ; 674: System.IdentityModel.Tokens.Jwt.dll => 0xfe1bc020 => 208
	i32 4271975918, ; 675: Microsoft.Maui.Controls.dll => 0xfea12dee => 199
	i32 4274623895, ; 676: CommunityToolkit.Mvvm.dll => 0xfec99597 => 177
	i32 4274976490, ; 677: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 678: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 257
	i32 4294763496 ; 679: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 243
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [680 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 253, ; 3
	i32 287, ; 4
	i32 48, ; 5
	i32 305, ; 6
	i32 80, ; 7
	i32 314, ; 8
	i32 145, ; 9
	i32 298, ; 10
	i32 299, ; 11
	i32 30, ; 12
	i32 338, ; 13
	i32 124, ; 14
	i32 203, ; 15
	i32 102, ; 16
	i32 322, ; 17
	i32 271, ; 18
	i32 107, ; 19
	i32 271, ; 20
	i32 139, ; 21
	i32 291, ; 22
	i32 337, ; 23
	i32 330, ; 24
	i32 77, ; 25
	i32 124, ; 26
	i32 13, ; 27
	i32 227, ; 28
	i32 132, ; 29
	i32 273, ; 30
	i32 151, ; 31
	i32 18, ; 32
	i32 225, ; 33
	i32 26, ; 34
	i32 247, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 91, ; 39
	i32 230, ; 40
	i32 303, ; 41
	i32 300, ; 42
	i32 147, ; 43
	i32 249, ; 44
	i32 246, ; 45
	i32 54, ; 46
	i32 69, ; 47
	i32 335, ; 48
	i32 216, ; 49
	i32 83, ; 50
	i32 313, ; 51
	i32 204, ; 52
	i32 248, ; 53
	i32 131, ; 54
	i32 55, ; 55
	i32 149, ; 56
	i32 74, ; 57
	i32 145, ; 58
	i32 62, ; 59
	i32 146, ; 60
	i32 339, ; 61
	i32 165, ; 62
	i32 333, ; 63
	i32 231, ; 64
	i32 12, ; 65
	i32 244, ; 66
	i32 125, ; 67
	i32 152, ; 68
	i32 113, ; 69
	i32 166, ; 70
	i32 164, ; 71
	i32 246, ; 72
	i32 192, ; 73
	i32 259, ; 74
	i32 311, ; 75
	i32 84, ; 76
	i32 189, ; 77
	i32 150, ; 78
	i32 291, ; 79
	i32 60, ; 80
	i32 297, ; 81
	i32 332, ; 82
	i32 185, ; 83
	i32 51, ; 84
	i32 103, ; 85
	i32 114, ; 86
	i32 299, ; 87
	i32 179, ; 88
	i32 40, ; 89
	i32 284, ; 90
	i32 282, ; 91
	i32 120, ; 92
	i32 175, ; 93
	i32 52, ; 94
	i32 44, ; 95
	i32 119, ; 96
	i32 236, ; 97
	i32 324, ; 98
	i32 242, ; 99
	i32 81, ; 100
	i32 136, ; 101
	i32 278, ; 102
	i32 223, ; 103
	i32 8, ; 104
	i32 73, ; 105
	i32 155, ; 106
	i32 293, ; 107
	i32 154, ; 108
	i32 92, ; 109
	i32 288, ; 110
	i32 45, ; 111
	i32 292, ; 112
	i32 109, ; 113
	i32 205, ; 114
	i32 129, ; 115
	i32 25, ; 116
	i32 213, ; 117
	i32 72, ; 118
	i32 55, ; 119
	i32 46, ; 120
	i32 330, ; 121
	i32 188, ; 122
	i32 237, ; 123
	i32 22, ; 124
	i32 251, ; 125
	i32 86, ; 126
	i32 43, ; 127
	i32 160, ; 128
	i32 71, ; 129
	i32 264, ; 130
	i32 315, ; 131
	i32 3, ; 132
	i32 42, ; 133
	i32 63, ; 134
	i32 329, ; 135
	i32 16, ; 136
	i32 53, ; 137
	i32 326, ; 138
	i32 287, ; 139
	i32 105, ; 140
	i32 303, ; 141
	i32 292, ; 142
	i32 319, ; 143
	i32 285, ; 144
	i32 248, ; 145
	i32 34, ; 146
	i32 158, ; 147
	i32 85, ; 148
	i32 32, ; 149
	i32 328, ; 150
	i32 12, ; 151
	i32 51, ; 152
	i32 56, ; 153
	i32 268, ; 154
	i32 36, ; 155
	i32 184, ; 156
	i32 286, ; 157
	i32 221, ; 158
	i32 35, ; 159
	i32 309, ; 160
	i32 58, ; 161
	i32 255, ; 162
	i32 191, ; 163
	i32 178, ; 164
	i32 17, ; 165
	i32 289, ; 166
	i32 207, ; 167
	i32 164, ; 168
	i32 331, ; 169
	i32 325, ; 170
	i32 321, ; 171
	i32 254, ; 172
	i32 187, ; 173
	i32 180, ; 174
	i32 281, ; 175
	i32 327, ; 176
	i32 153, ; 177
	i32 277, ; 178
	i32 262, ; 179
	i32 223, ; 180
	i32 29, ; 181
	i32 177, ; 182
	i32 52, ; 183
	i32 282, ; 184
	i32 5, ; 185
	i32 307, ; 186
	i32 272, ; 187
	i32 276, ; 188
	i32 228, ; 189
	i32 293, ; 190
	i32 220, ; 191
	i32 239, ; 192
	i32 316, ; 193
	i32 85, ; 194
	i32 281, ; 195
	i32 61, ; 196
	i32 112, ; 197
	i32 336, ; 198
	i32 57, ; 199
	i32 337, ; 200
	i32 268, ; 201
	i32 99, ; 202
	i32 19, ; 203
	i32 232, ; 204
	i32 111, ; 205
	i32 101, ; 206
	i32 102, ; 207
	i32 305, ; 208
	i32 104, ; 209
	i32 285, ; 210
	i32 71, ; 211
	i32 38, ; 212
	i32 32, ; 213
	i32 103, ; 214
	i32 73, ; 215
	i32 208, ; 216
	i32 311, ; 217
	i32 9, ; 218
	i32 123, ; 219
	i32 46, ; 220
	i32 222, ; 221
	i32 189, ; 222
	i32 9, ; 223
	i32 43, ; 224
	i32 4, ; 225
	i32 269, ; 226
	i32 193, ; 227
	i32 335, ; 228
	i32 31, ; 229
	i32 138, ; 230
	i32 92, ; 231
	i32 93, ; 232
	i32 210, ; 233
	i32 49, ; 234
	i32 141, ; 235
	i32 112, ; 236
	i32 140, ; 237
	i32 174, ; 238
	i32 238, ; 239
	i32 115, ; 240
	i32 304, ; 241
	i32 286, ; 242
	i32 157, ; 243
	i32 76, ; 244
	i32 79, ; 245
	i32 258, ; 246
	i32 37, ; 247
	i32 280, ; 248
	i32 196, ; 249
	i32 176, ; 250
	i32 242, ; 251
	i32 235, ; 252
	i32 64, ; 253
	i32 138, ; 254
	i32 15, ; 255
	i32 116, ; 256
	i32 274, ; 257
	i32 283, ; 258
	i32 230, ; 259
	i32 48, ; 260
	i32 70, ; 261
	i32 80, ; 262
	i32 126, ; 263
	i32 94, ; 264
	i32 121, ; 265
	i32 290, ; 266
	i32 26, ; 267
	i32 251, ; 268
	i32 97, ; 269
	i32 28, ; 270
	i32 226, ; 271
	i32 306, ; 272
	i32 149, ; 273
	i32 169, ; 274
	i32 4, ; 275
	i32 98, ; 276
	i32 33, ; 277
	i32 93, ; 278
	i32 273, ; 279
	i32 185, ; 280
	i32 21, ; 281
	i32 41, ; 282
	i32 170, ; 283
	i32 322, ; 284
	i32 244, ; 285
	i32 314, ; 286
	i32 190, ; 287
	i32 179, ; 288
	i32 296, ; 289
	i32 258, ; 290
	i32 289, ; 291
	i32 283, ; 292
	i32 263, ; 293
	i32 2, ; 294
	i32 134, ; 295
	i32 111, ; 296
	i32 302, ; 297
	i32 186, ; 298
	i32 213, ; 299
	i32 331, ; 300
	i32 58, ; 301
	i32 95, ; 302
	i32 196, ; 303
	i32 313, ; 304
	i32 39, ; 305
	i32 224, ; 306
	i32 25, ; 307
	i32 94, ; 308
	i32 307, ; 309
	i32 89, ; 310
	i32 99, ; 311
	i32 10, ; 312
	i32 87, ; 313
	i32 318, ; 314
	i32 100, ; 315
	i32 270, ; 316
	i32 181, ; 317
	i32 0, ; 318
	i32 290, ; 319
	i32 215, ; 320
	i32 197, ; 321
	i32 310, ; 322
	i32 7, ; 323
	i32 255, ; 324
	i32 212, ; 325
	i32 191, ; 326
	i32 88, ; 327
	i32 250, ; 328
	i32 154, ; 329
	i32 309, ; 330
	i32 33, ; 331
	i32 116, ; 332
	i32 82, ; 333
	i32 20, ; 334
	i32 301, ; 335
	i32 304, ; 336
	i32 11, ; 337
	i32 162, ; 338
	i32 3, ; 339
	i32 201, ; 340
	i32 317, ; 341
	i32 188, ; 342
	i32 186, ; 343
	i32 84, ; 344
	i32 294, ; 345
	i32 64, ; 346
	i32 319, ; 347
	i32 277, ; 348
	i32 143, ; 349
	i32 301, ; 350
	i32 259, ; 351
	i32 157, ; 352
	i32 195, ; 353
	i32 41, ; 354
	i32 117, ; 355
	i32 182, ; 356
	i32 214, ; 357
	i32 266, ; 358
	i32 131, ; 359
	i32 75, ; 360
	i32 66, ; 361
	i32 323, ; 362
	i32 172, ; 363
	i32 300, ; 364
	i32 218, ; 365
	i32 143, ; 366
	i32 106, ; 367
	i32 151, ; 368
	i32 70, ; 369
	i32 317, ; 370
	i32 156, ; 371
	i32 194, ; 372
	i32 181, ; 373
	i32 121, ; 374
	i32 127, ; 375
	i32 318, ; 376
	i32 152, ; 377
	i32 241, ; 378
	i32 141, ; 379
	i32 228, ; 380
	i32 315, ; 381
	i32 20, ; 382
	i32 14, ; 383
	i32 135, ; 384
	i32 75, ; 385
	i32 59, ; 386
	i32 231, ; 387
	i32 167, ; 388
	i32 168, ; 389
	i32 199, ; 390
	i32 15, ; 391
	i32 74, ; 392
	i32 6, ; 393
	i32 23, ; 394
	i32 321, ; 395
	i32 253, ; 396
	i32 207, ; 397
	i32 212, ; 398
	i32 91, ; 399
	i32 295, ; 400
	i32 0, ; 401
	i32 316, ; 402
	i32 1, ; 403
	i32 136, ; 404
	i32 320, ; 405
	i32 254, ; 406
	i32 276, ; 407
	i32 134, ; 408
	i32 69, ; 409
	i32 146, ; 410
	i32 325, ; 411
	i32 294, ; 412
	i32 245, ; 413
	i32 187, ; 414
	i32 88, ; 415
	i32 96, ; 416
	i32 235, ; 417
	i32 240, ; 418
	i32 320, ; 419
	i32 31, ; 420
	i32 209, ; 421
	i32 45, ; 422
	i32 249, ; 423
	i32 194, ; 424
	i32 173, ; 425
	i32 211, ; 426
	i32 214, ; 427
	i32 109, ; 428
	i32 158, ; 429
	i32 35, ; 430
	i32 22, ; 431
	i32 174, ; 432
	i32 114, ; 433
	i32 57, ; 434
	i32 274, ; 435
	i32 144, ; 436
	i32 118, ; 437
	i32 120, ; 438
	i32 110, ; 439
	i32 216, ; 440
	i32 139, ; 441
	i32 222, ; 442
	i32 190, ; 443
	i32 306, ; 444
	i32 54, ; 445
	i32 105, ; 446
	i32 326, ; 447
	i32 204, ; 448
	i32 200, ; 449
	i32 201, ; 450
	i32 133, ; 451
	i32 288, ; 452
	i32 279, ; 453
	i32 267, ; 454
	i32 332, ; 455
	i32 245, ; 456
	i32 203, ; 457
	i32 159, ; 458
	i32 232, ; 459
	i32 163, ; 460
	i32 132, ; 461
	i32 267, ; 462
	i32 161, ; 463
	i32 256, ; 464
	i32 140, ; 465
	i32 279, ; 466
	i32 275, ; 467
	i32 169, ; 468
	i32 202, ; 469
	i32 211, ; 470
	i32 176, ; 471
	i32 217, ; 472
	i32 284, ; 473
	i32 40, ; 474
	i32 243, ; 475
	i32 81, ; 476
	i32 56, ; 477
	i32 37, ; 478
	i32 97, ; 479
	i32 166, ; 480
	i32 172, ; 481
	i32 280, ; 482
	i32 82, ; 483
	i32 219, ; 484
	i32 98, ; 485
	i32 30, ; 486
	i32 159, ; 487
	i32 206, ; 488
	i32 18, ; 489
	i32 127, ; 490
	i32 119, ; 491
	i32 239, ; 492
	i32 270, ; 493
	i32 252, ; 494
	i32 206, ; 495
	i32 272, ; 496
	i32 165, ; 497
	i32 302, ; 498
	i32 247, ; 499
	i32 209, ; 500
	i32 339, ; 501
	i32 312, ; 502
	i32 269, ; 503
	i32 260, ; 504
	i32 170, ; 505
	i32 16, ; 506
	i32 144, ; 507
	i32 197, ; 508
	i32 125, ; 509
	i32 118, ; 510
	i32 38, ; 511
	i32 115, ; 512
	i32 47, ; 513
	i32 142, ; 514
	i32 117, ; 515
	i32 34, ; 516
	i32 178, ; 517
	i32 95, ; 518
	i32 53, ; 519
	i32 261, ; 520
	i32 129, ; 521
	i32 153, ; 522
	i32 24, ; 523
	i32 161, ; 524
	i32 238, ; 525
	i32 148, ; 526
	i32 104, ; 527
	i32 89, ; 528
	i32 226, ; 529
	i32 60, ; 530
	i32 142, ; 531
	i32 100, ; 532
	i32 5, ; 533
	i32 13, ; 534
	i32 122, ; 535
	i32 135, ; 536
	i32 28, ; 537
	i32 312, ; 538
	i32 193, ; 539
	i32 72, ; 540
	i32 236, ; 541
	i32 24, ; 542
	i32 224, ; 543
	i32 297, ; 544
	i32 265, ; 545
	i32 262, ; 546
	i32 329, ; 547
	i32 137, ; 548
	i32 217, ; 549
	i32 233, ; 550
	i32 168, ; 551
	i32 195, ; 552
	i32 266, ; 553
	i32 308, ; 554
	i32 101, ; 555
	i32 123, ; 556
	i32 237, ; 557
	i32 183, ; 558
	i32 163, ; 559
	i32 167, ; 560
	i32 240, ; 561
	i32 39, ; 562
	i32 198, ; 563
	i32 327, ; 564
	i32 17, ; 565
	i32 171, ; 566
	i32 328, ; 567
	i32 137, ; 568
	i32 150, ; 569
	i32 229, ; 570
	i32 155, ; 571
	i32 130, ; 572
	i32 19, ; 573
	i32 65, ; 574
	i32 180, ; 575
	i32 295, ; 576
	i32 205, ; 577
	i32 147, ; 578
	i32 173, ; 579
	i32 47, ; 580
	i32 210, ; 581
	i32 336, ; 582
	i32 338, ; 583
	i32 215, ; 584
	i32 79, ; 585
	i32 61, ; 586
	i32 106, ; 587
	i32 264, ; 588
	i32 219, ; 589
	i32 49, ; 590
	i32 250, ; 591
	i32 333, ; 592
	i32 261, ; 593
	i32 14, ; 594
	i32 182, ; 595
	i32 68, ; 596
	i32 171, ; 597
	i32 225, ; 598
	i32 229, ; 599
	i32 192, ; 600
	i32 78, ; 601
	i32 234, ; 602
	i32 108, ; 603
	i32 218, ; 604
	i32 260, ; 605
	i32 67, ; 606
	i32 63, ; 607
	i32 27, ; 608
	i32 160, ; 609
	i32 308, ; 610
	i32 227, ; 611
	i32 10, ; 612
	i32 198, ; 613
	i32 11, ; 614
	i32 175, ; 615
	i32 78, ; 616
	i32 126, ; 617
	i32 83, ; 618
	i32 184, ; 619
	i32 66, ; 620
	i32 296, ; 621
	i32 107, ; 622
	i32 65, ; 623
	i32 128, ; 624
	i32 122, ; 625
	i32 77, ; 626
	i32 275, ; 627
	i32 265, ; 628
	i32 8, ; 629
	i32 233, ; 630
	i32 2, ; 631
	i32 324, ; 632
	i32 44, ; 633
	i32 278, ; 634
	i32 156, ; 635
	i32 128, ; 636
	i32 263, ; 637
	i32 23, ; 638
	i32 298, ; 639
	i32 133, ; 640
	i32 221, ; 641
	i32 252, ; 642
	i32 29, ; 643
	i32 220, ; 644
	i32 62, ; 645
	i32 200, ; 646
	i32 90, ; 647
	i32 87, ; 648
	i32 148, ; 649
	i32 310, ; 650
	i32 202, ; 651
	i32 36, ; 652
	i32 86, ; 653
	i32 241, ; 654
	i32 334, ; 655
	i32 183, ; 656
	i32 50, ; 657
	i32 6, ; 658
	i32 90, ; 659
	i32 334, ; 660
	i32 21, ; 661
	i32 162, ; 662
	i32 96, ; 663
	i32 50, ; 664
	i32 113, ; 665
	i32 257, ; 666
	i32 130, ; 667
	i32 76, ; 668
	i32 27, ; 669
	i32 323, ; 670
	i32 234, ; 671
	i32 256, ; 672
	i32 7, ; 673
	i32 208, ; 674
	i32 199, ; 675
	i32 177, ; 676
	i32 110, ; 677
	i32 257, ; 678
	i32 243 ; 679
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
