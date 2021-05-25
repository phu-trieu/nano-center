# nano-center
A full stack Node.js and React shopping cart app.
https://wicked-sales.phutrieu.com/

**Technologies**
* React.js
* HTML5
* CSS3
* Bootstrap 5
* Node.js
* Express
* PostgreSQL
* AWS EC2
* Webpack 4

**Features**
* User can view a list of products for sale.
* User can view the details of the products.
* User can add a product to their cart.
* User can view their cart summary.
* User can place an order.

**Previews**

##### View list of products and their details

![View products/product details preview](./server/public/images/preview-gifs/wicked-sales-view-products.gif)

##### Add to cart

![Add to cart preview](./server/public/images/preview-gifs/wicked-sales-add-to-cart.gif)

##### Place an order

![Place an order preview](./server/public/images/preview-gifs/wicked-sales-checkout.gif)

**System Requirements**
* Node.js (10 or higher)
* NPM (6 or higher)
* PostgreSQL

**Getting Started**
1. Clone the repository.
```shell
git clone https://github.com/phutrieu95/nano-center
```
2. Navigate to the directory.
```shell
cd nano-center
```
3. Install all dependencies needed.
```shell
npm install
```
4. In a separate terminal, initialize PostgreSQL server.
```shell
sudo service postgresql start
```
5. Import the database.
```shell
npm run db:import
```
   * If you would like a GUI for the database via pgweb, run the following command. The GUI can then be accessed by opening http://localhost:8081 in your browser.
```shell
pgweb --db=nanoCenter
```
6. Start the project. Once your system finishes compiling, you can view the application by opening http://localhost:3000 in your browser.
```shell
npm run dev
```
