Team members
Alexandra Cheng (yc3492)
Ruqian Wang (rw2918)
Wen Chen (wc2787)
Nan Liao (nl2783)

Ruby version: 2.6.6

Machine's OS: Mac Montery 12.1

Branch: main

Instructions:

## Running locally

1. To run the webserver, first fork this repository 

        git clone `https://github.com/nliao917/Chef-Effortless`

2. Run

        `bundle install --without production`

3. If running into issues regarding gem/bundle version (run a or b):

        a.

        gem install bundler

        bundle update

        b.

        gem install bundler:2.0.0.pre.3

        bundle _2.0.0.pre.3_ install --without production 

4. Then to set up the database:

        rake db:setup

5. Run it on the server

        rails server -b 0.0.0.0

Open you web browser to `http://localhost:3000` and enjoy!


