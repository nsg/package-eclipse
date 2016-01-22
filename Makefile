
build:
	docker build -t eclipse .

package: build
	docker cp $$(docker create eclipse):/build/eclipse_4.5.1_amd64.deb $$PWD

clean:
	rm *.deb
