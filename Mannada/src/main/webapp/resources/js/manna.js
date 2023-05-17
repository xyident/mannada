window.addEventListener("load", () => {

    getPage(1);

    document.getElementById("search-btn").addEventListener("click", e => {
        const search = document.querySelector("select[name='search']").value;
        const keyword = document.querySelector("input[name='keyword']").value;
        const minPrice = document.querySelector("input[name='minPrice']").value;
        const maxPrice = document.querySelector("input[name='maxPrice']").value;
        const category = document.querySelector("select[name='category']").value;
        const status = document.querySelector("select[name='status']").value;

        if (search == 1 || search == 2)
            getPage(1, { search, keyword });
        else if (search == 3)
            getPage(1, { search, minPrice, maxPrice });
        else if (search == 4)
            getPage(1, { search, keyword: category });
        else if (search == 5)
            getPage(1, { search, keyword: status });
    });
});

function getPage(page, query) {
    let url = `${pager_url}?page=${page}`;

    if (query)
        url += "&" + new URLSearchParams(query).toString();

    console.log(url);

    fetch(url)
        .then(resp => resp.json())
        .then(result => {
            if (result.list.length)
                document.querySelector("#empty_list").classList.add("hide");
            else
                document.querySelector("#empty_list").classList.remove("hide");

            
            document.querySelector("#more-btn").onclick = e => getPage(page + 1, query);


            // 더보기 조건    
            if(page <= result.pager.last){
                const box = document.querySelector("#card-box");
    
                result.list.forEach(element => {
                    const item = makeItem(element);
    
                    box.append(item);
                });
            };
                
        });
}



function makeItem(element){
    const card = document.createElement("div");
    card.classList.add("card");    
    card.dataset.id = element.id;


    const category = document.createElement("div");
    category.classList.add("category");

    const span = document.createElement("span");
    span.textContent = element["category_"];

    category.append(span);
    card.append(category);


    const title = document.createElement("div");
    category.classList.add("title");

    const h5 = document.createElement("h5");
    h5.textContent = element["title"];

    title.append(h5);
    card.append("title");


    const line = document.createElement("div");
    category.classList.add("line");

    card.append(line);


    const i = document.createElement("i");
    i.classList.add("bi", "bi-check");

    const address = document.createElement("div");
    address.classList.add("address");

    address.append(i);
    address.textContent = element["address"];
    
    card.append(address);
    
    
    const dDay = document.createElement("div");
    dDay.classList.add("dDay");
    
    dDay.append(i);
    dDay.textContent = element["dDay"];
    
    card.append(dDay);


    const member = document.createElement("div");
    member.classList.add("member");

    member.append(i);
    member.textContent = "(" + element["sum"] + "/" + element["member"] + ")";
    
    card.append(member);


    const progress = document.createElement("progress");
    progress.value = element["sum"];
    progress.max = element["member"];

    card.append(progress);


    return card;
}