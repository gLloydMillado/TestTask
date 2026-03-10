<script setup>
import { ref } from 'vue'
import { useForm, router } from '@inertiajs/vue3'

const props = defineProps({
    products: {
        type: Array,
        default: () => []
    }
})

const showModal = ref(false)
const isEditing = ref(false)

const form = useForm({
    id: null,
    name: '',
    price: ''
})

const openAdd = () => {
    form.reset()
    form.id = null
    isEditing.value = false
    showModal.value = true
}

const openEdit = (product) => {
    form.id = product.id
    form.name = product.name
    form.price = product.price
    isEditing.value = true
    showModal.value = true
}

const saveProduct = () => {

    if (isEditing.value) {

        form.put(`/products/${form.id}`, {
            onSuccess: () => {
                showModal.value = false
            }
        })

    } else {

        form.post('/products', {
            onSuccess: () => {
                showModal.value = false
            }
        })

    }

}

const deleteProduct = (id) => {

    if (confirm("Delete this product?")) {
        router.delete(`/products/${id}`)
    }

}
</script>

<template>
<div class="p-6 lg:p-8 bg-white border-b border-gray-200">

    <h1 class="text-2xl font-bold mb-6">
        Glemer's Simple CRUD
    </h1>

    <button
        @click="openAdd"
        class="mb-4 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
    >
        Add Product
    </button>

    <div class="overflow-x-auto">
        <table class="min-w-full border border-gray-200">
            <thead class="bg-gray-100">
                <tr>
                    <th class="p-3 border">ID</th>
                    <th class="p-3 border">Name</th>
                    <th class="p-3 border">Price</th>
                    <th class="p-3 border">Actions</th>
                </tr>
            </thead>

            <tbody v-if="props.products.length > 0">
                <tr v-for="product in props.products" :key="product.id">
                    <td class="p-3 border">{{ product.id }}</td>
                    <td class="p-3 border">{{ product.name }}</td>
                    <td class="p-3 border">{{ product.price }}</td>

                    <td class="p-3 border space-x-2 flex justify-end">
                        <button
                            @click="openEdit(product)"
                            class="px-3 py-1 bg-yellow-500 text-white rounded"
                        >
                            Edit
                        </button>

                        <button
                            @click="deleteProduct(product.id)"
                            class="px-3 py-1 bg-red-600 text-white rounded"
                        >
                            Delete
                        </button>
                    </td>
                </tr>
            </tbody>

            <tbody v-else>
                <tr>
                    <td colspan="4" class="text-center p-6 text-gray-500 italic">
                        No products available. Click "Add Product" to create one.
                    </td>
                </tr>
            </tbody>

        </table>
    </div>

    <div
        v-if="showModal"
        class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-40"
    >
        <div class="bg-white p-6 rounded w-96">

            <h2 class="text-xl font-semibold mb-4">
                {{ isEditing ? 'Edit Product' : 'Add Product' }}
            </h2>

            <div class="space-y-4">

                <input
                    v-model="form.name"
                    type="text"
                    placeholder="Product Name"
                    class="w-full border p-2 rounded"
                />

                <input
                    v-model="form.price"
                    type="number"
                    placeholder="Price"
                    class="w-full border p-2 rounded"
                />

                <div class="flex justify-end space-x-2">

                    <button
                        @click="showModal=false"
                        class="px-4 py-2 bg-gray-400 text-white rounded"
                    >
                        Cancel
                    </button>

                    <button
                        @click="saveProduct"
                        class="px-4 py-2 bg-blue-600 text-white rounded"
                        :disabled="form.processing"
                    >
                        Save
                    </button>

                </div>

            </div>

        </div>
    </div>

</div>
</template>