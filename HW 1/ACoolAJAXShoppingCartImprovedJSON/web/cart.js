// Timestamp of cart that page was last updated with
var lastCartUpdate = 0;

/*
 * Adds the specified item to the shopping cart, via Ajax call
 * itemCode - product code of the item to add
 */
function addToCart(itemCode) {

    var req = newXMLHttpRequest();

    req.onreadystatechange = getReadyStateHandler(req, updateCart);

    req.open("POST", "cart.do", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send("action=add&item=" + itemCode);
}

/*
 * Removes the specified item from the shopping cart, via Ajax call
 * itemCode - product code of the item to remove
 */
function removeFromCart(itemCode) {

    var req = newXMLHttpRequest();

    req.onreadystatechange = getReadyStateHandler(req, updateCart);

    req.open("POST", "cart.do", true);
    req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    req.send("action=remove&item=" + itemCode);
}


/*
 * Update shopping-cart area of page to reflect contents of cart
 * described in XML document.
 */
function updateCart(cartXML) {

    // Use library to parse the string back from server
    var myJsonObj = jsonParse(cartXML);

    var jcart = myJsonObj.cart[0];
    var generated = jcart.generated;
    if (generated > lastCartUpdate) {
        lastCartUpdate = generated;
        var contents = document.getElementById("contents");
        contents.innerHTML = "";

        var items = jcart.item;
        for (var I = 0; I < items.length; I++) {

            var jitem = items[I];
            var jname = jitem.name;
            var jquantity = jitem.quantity;

            var listItem = document.createElement("li");
            listItem.appendChild(document.createTextNode(jname + " x " + jquantity));
            contents.appendChild(listItem);

        }

    }

    document.getElementById("total").innerHTML = jcart.total;
}
