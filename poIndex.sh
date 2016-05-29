#en_GB
for folderLang in `ls`
do
	if( [ -e $folderLang ] )
	then
		if( [ -d $folderLang ] )
		then
			cd $folderLang
			#LC_
			for folderLC in `ls`
			do
				cd $folderLC
				#po & mo file
				for file in `ls`
				do

					filetype=`echo "${file: -2}"`
					if( [ $filetype == "po" ] )
					then
						#echo $folderLang . $file

						filename="${file%.*}".mo
						#echo $filename

						pwd						

						#msgfmt -cv /dev/null $file
						msgfmt -o $filename $file
					fi
				done
				cd ..
			done
			cd ..
		fi
	fi
done
#check if it is a file & the ext = .po & .mo
#msgfmt -o messages.mo messages.po
#msgfmt -cv /dev/null
